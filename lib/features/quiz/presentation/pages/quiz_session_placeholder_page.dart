import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context.dart';
import '../../domain/providers/learning_session_provider.dart';
import '../../utils/learning_session_error_translator.dart';

/// Placeholder until LEARN-03c implements the interactive QCM session UI.
class QuizSessionPlaceholderPage extends ConsumerStatefulWidget {
  const QuizSessionPlaceholderPage({super.key, required this.sessionId});

  final String sessionId;

  @override
  ConsumerState<QuizSessionPlaceholderPage> createState() =>
      _QuizSessionPlaceholderPageState();
}

class _QuizSessionPlaceholderPageState
    extends ConsumerState<QuizSessionPlaceholderPage> {
  String? _title;
  Object? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadSession);
  }

  Future<void> _loadSession() async {
    try {
      final session = await ref
          .read(learningSessionServiceProvider)
          .getById(widget.sessionId);
      if (!mounted) {
        return;
      }
      setState(() {
        _title = session.title;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = error;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(_title ?? l10n.quizTitle)),
      body: Center(
        child: _isLoading
            ? Text(l10n.quizLoading)
            : _error != null
            ? Text(LearningSessionErrorTranslator.fromException(context, _error!))
            : Text(l10n.quizSessionPlaceholderMessage),
      ),
    );
  }
}
