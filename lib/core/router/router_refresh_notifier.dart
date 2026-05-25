import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/domain/providers/auth_provider.dart';

/// Triggers [GoRouter] redirect re-evaluation on auth bootstrap and session changes.
class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(this._ref) {
    _subscriptions.add(
      _ref.listen(authBootstrapProvider, (_, _) => notifyListeners()),
    );
    _authSubscription = _ref
        .read(authServiceProvider)
        .authStateChanges()
        .listen((_) => notifyListeners());
  }

  final Ref _ref;
  final List<ProviderSubscription<Object?>> _subscriptions = [];
  StreamSubscription<Object?>? _authSubscription;

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.close();
    }
    unawaited(_authSubscription?.cancel());
    super.dispose();
  }
}
