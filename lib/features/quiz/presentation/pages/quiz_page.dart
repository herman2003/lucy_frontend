import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../utils/quiz_error_translator.dart';
import '../controllers/quiz_notifier.dart';
import '../widgets/quiz_no_corpus_banner.dart';

/// Quiz tab — corpus guard + future generation (SPEC §3 D4b).
class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizProvider.notifier).bootstrap();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);
    final l10n = context.l10n;

    ref.listen(quizProvider, (previous, next) {
      if (next.errorCode != null && next.errorCode != previous?.errorCode) {
        LucySnackBar.showError(
          context,
          message: QuizErrorTranslator.translate(context, next.errorCode!),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.quizTitle)),
      body: state.isLoading
          ? Center(child: Text(l10n.quizLoading))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!state.canQuiz && state.eligibility != null)
                  const QuizNoCorpusBanner(),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        LucyConstants.kSpacingLarge,
                      ),
                      child: Text(
                        state.canQuiz
                            ? l10n.quizComingSoon
                            : l10n.quizEmptyHint,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
