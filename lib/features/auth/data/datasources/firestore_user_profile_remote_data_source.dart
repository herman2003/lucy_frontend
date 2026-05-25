import 'package:cloud_firestore/cloud_firestore.dart';

import '../dtos/user_profile_dto.dart';
import '../mappers/user_profile_mapper.dart';
import 'user_profile_remote_data_source.dart';

/// Firestore `users/{uid}` writes — sole `cloud_firestore` entry for auth profile.
class FirestoreUserProfileRemoteDataSource
    implements UserProfileRemoteDataSource {
  FirestoreUserProfileRemoteDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  static const String _usersCollection = 'users';

  @override
  Future<void> createUserProfile({
    required String uid,
    required UserProfileDto profile,
  }) async {
    await _firestore
        .collection(_usersCollection)
        .doc(uid)
        .set(profile.toFirestoreMap());
  }
}
