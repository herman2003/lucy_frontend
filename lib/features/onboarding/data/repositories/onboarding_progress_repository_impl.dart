import '../../domain/entities/onboarding_resume_progress.dart';
import '../../domain/repositories/onboarding_progress_repository.dart';
import '../datasources/onboarding_progress_api_remote_data_source.dart';

class OnboardingProgressRepositoryImpl implements OnboardingProgressRepository {
  OnboardingProgressRepositoryImpl(this._remote);

  final OnboardingProgressApiRemoteDataSource _remote;

  @override
  Future<OnboardingResumeProgress?> fetchProgress({required String uid}) {
    return _remote.fetchProgress(uid: uid);
  }
}
