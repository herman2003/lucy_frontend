import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/lucy_dio_client.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_remote_data_source.dart';
import '../datasources/user_profile_api_remote_data_source.dart';
import '../repositories/auth_repository_impl.dart';

part 'auth_data_provider.g.dart';

LucyDioClient _authLucyDioClient() {
  return LucyDioClient(
    idTokenProvider: ({bool forceRefresh = false}) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return null;
      }
      return user.getIdToken(forceRefresh);
    },
  );
}

/// Wires Firebase Auth + Nest profile API to [AuthRepositoryImpl].
@Riverpod(keepAlive: true)
AuthRepository authRepositoryImpl(Ref ref) {
  final dioClient = _authLucyDioClient();
  return AuthRepositoryImpl(
    authRemote: FirebaseAuthRemoteDataSource(FirebaseAuth.instance),
    profileRemote: UserProfileApiRemoteDataSource(dioClient.dio),
  );
}
