import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/onboarding_resume_progress.dart';
import '../../domain/entities/onboarding_transcript_turn.dart';

/// Reads onboarding fields on `users/{uid}` (Nest writer, Flutter read).
class OnboardingProgressFirestoreDataSource {
  OnboardingProgressFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  static const String _usersCollection = 'users';

  Future<OnboardingResumeProgress?> fetchProgress({required String uid}) async {
    final snapshot =
        await _firestore.collection(_usersCollection).doc(uid).get();
    final data = snapshot.data();
    if (data == null) {
      return null;
    }

    final transcript = _parseTranscript(data['onboardingTranscript']);
    if (transcript.isEmpty) {
      return null;
    }

    final status = data['onboardingStatus'];
    return OnboardingResumeProgress(
      onboardingStatus: status is String ? status : 'in_progress',
      transcript: transcript,
    );
  }

  List<OnboardingTranscriptTurn> _parseTranscript(Object? raw) {
    if (raw is! List) {
      return const [];
    }

    final turns = <OnboardingTranscriptTurn>[];
    for (final entry in raw) {
      if (entry is! Map) {
        continue;
      }
      final map = Map<String, dynamic>.from(entry);
      final questionId = map['questionId'];
      final questionText = map['questionText'];
      final answerText = map['answerText'];
      final confirmedAt = map['confirmedAt'];
      if (questionId is! String ||
          questionText is! String ||
          answerText is! String ||
          confirmedAt is! String) {
        continue;
      }
      turns.add(
        OnboardingTranscriptTurn(
          questionId: questionId,
          questionText: questionText,
          answerText: answerText,
          confirmedAt: confirmedAt,
        ),
      );
    }
    return turns;
  }
}
