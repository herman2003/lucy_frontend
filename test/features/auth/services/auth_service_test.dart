import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/exceptions/auth_exception.dart';
import 'package:frontend/features/auth/services/auth_service.dart';

import '../helpers/fake_auth_repository.dart';

void main() {
  group('AuthService', () {
    late FakeAuthRepository repository;
    late AuthService service;

    setUp(() {
      repository = FakeAuthRepository(null);
      service = AuthService(repository: repository);
    });

    test('delegates signOut to repository', () async {
      await service.signOut();

      expect(repository.currentUser, isNull);
    });

    test('authStateChanges mirrors repository stream on login', () async {
      final events = <AuthUser?>[];
      final subscription = service.authStateChanges().listen(events.add);
      addTearDown(subscription.cancel);

      await service.loginWithEmail(
        email: 'a@lucy.test',
        password: 'password1',
      );

      expect(events.last?.email, 'a@lucy.test');
      expect(service.currentUser?.email, 'a@lucy.test');
    });

    test('delegates loginWithEmail to repository', () async {
      final user = await service.loginWithEmail(
        email: 'user@lucy.test',
        password: 'secret12',
      );

      expect(user.email, 'user@lucy.test');
      expect(repository.currentUser?.email, 'user@lucy.test');
    });

    test('delegates signUpWithEmail to repository', () async {
      final user = await service.signUpWithEmail(
        email: 'new@lucy.test',
        password: 'secret12',
        fullName: 'Lucy User',
      );

      expect(user.displayName, 'Lucy User');
      expect(repository.currentUser?.displayName, 'Lucy User');
    });

    test('delegates sendPasswordResetEmail to repository', () async {
      await service.sendPasswordResetEmail(email: 'user@lucy.test');

      expect(repository.passwordResetErrorCode, isNull);
    });

    test('surfaces repository reset errors', () async {
      repository.passwordResetErrorCode = 'network-request-failed';

      await expectLater(
        service.sendPasswordResetEmail(email: 'user@lucy.test'),
        throwsA(isA<AuthException>()),
      );
    });
  });
}
