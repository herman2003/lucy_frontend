import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../domain/entities/onboarding_analyze_result.dart';
import '../../domain/providers/onboarding_provider.dart';
import '../../utils/learner_profile_l10n.dart';
import '../../utils/onboarding_error_translator.dart';
import '../controllers/onboarding_chat_notifier.dart';

/// Final onboarding recap before `POST finalize` (SPEC §4.7, F07).
class OnboardingConfirmPage extends ConsumerStatefulWidget {
  const OnboardingConfirmPage({super.key});

  @override
  ConsumerState<OnboardingConfirmPage> createState() =>
      _OnboardingConfirmPageState();
}

class _OnboardingConfirmPageState extends ConsumerState<OnboardingConfirmPage> {
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final chatState = ref.watch(onboardingChatProvider);
    final analyzeResult = chatState.analyzeResult;

    if (analyzeResult == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        context.go(LucyRoutePaths.onboarding);
      });
      return Scaffold(
        body: Center(child: Text(l10n.onboardingConfirmMissingAnalysis)),
      );
    }

    final summaryText = switch (analyzeResult) {
      OnboardingAnalyzeSuccess(:final summaryForUser) => summaryForUser,
      OnboardingAnalyzeFallback(:final fallbackProfileSummary) =>
        fallbackProfileSummary,
    };
    final profileRows = switch (analyzeResult) {
      OnboardingAnalyzeSuccess(:final learnerProfile) =>
        LearnerProfileL10n.profileRows(l10n, learnerProfile),
      OnboardingAnalyzeFallback() => <({String label, String value})>[],
    };

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(title: Text(l10n.onboardingConfirmTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
                children: [
                  Text(
                    l10n.onboardingConfirmSummaryHeading,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: LucyConstants.kSpacingLow),
                  Text(summaryText),
                  const SizedBox(height: LucyConstants.kSpacingMedium),
                  for (final row in profileRows) ...[
                    Text(
                      row.label,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: LucyConstants.kSpacingLow / 2),
                    Text(row.value),
                    const SizedBox(height: LucyConstants.kSpacingMedium),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LucyPrimaryButton(
                    text: l10n.onboardingConfirmAccept,
                    isLoading: _isSubmitting,
                    onPressed: _isSubmitting ? null : () => _accept(context),
                    width: double.infinity,
                  ),
                  const SizedBox(height: LucyConstants.kSpacingLow),
                  LucySecondaryButton(
                    text: l10n.onboardingConfirmEdit,
                    onPressed: _isSubmitting
                        ? null
                        : () async => _edit(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _accept(BuildContext context) async {
    setState(() => _isSubmitting = true);
    try {
      final service = ref.read(onboardingServiceProvider);
      await service.finalizeOnboarding();
      final uid = ref.read(authRepositoryProvider).currentUser?.uid;
      if (uid != null) {
        await service.clearLocalDraft(uid: uid);
      }
      ref.invalidate(authBootstrapProvider);
      if (!context.mounted) {
        return;
      }
      context.go(LucyRoutePaths.shellDefault);
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      LucySnackBar.showError(
        context,
        message: OnboardingErrorTranslator.fromException(context, error),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _edit(BuildContext context) async {
    final analyzeResult = ref.read(onboardingChatProvider).analyzeResult;
    if (analyzeResult is OnboardingAnalyzeFallback) {
      try {
        await ref
            .read(onboardingChatProvider.notifier)
            .retryAnalyzeWithReducedProfile();
      } catch (error) {
        if (!context.mounted) {
          return;
        }
        LucySnackBar.showError(
          context,
          message: OnboardingErrorTranslator.fromException(context, error),
        );
      }
      return;
    }

    ref
        .read(onboardingChatProvider.notifier)
        .returnToEditFromConfirm(context.l10n);
    if (context.mounted) {
      context.go(LucyRoutePaths.onboarding);
    }
  }
}
