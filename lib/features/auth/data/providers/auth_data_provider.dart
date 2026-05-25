import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_remote_data_source.dart';
import '../datasources/firestore_user_profile_remote_data_source.dart';
import '../repositories/auth_repository_impl.dart';

part 'auth_data_provider.g.dart';

/// Wires Firebase SDKs to [AuthRepositoryImpl] (data layer only).
@Riverpod(keepAlive: true)
AuthRepository authRepositoryImpl(Ref ref) {
  return AuthRepositoryImpl(
    authRemote: FirebaseAuthRemoteDataSource(FirebaseAuth.instance),
    profileRemote: FirestoreUserProfileRemoteDataSource(
      FirebaseFirestore.instance,
    ),
  );
}
