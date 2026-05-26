import 'package:frontend/features/documents/domain/providers/documents_provider.dart';
import 'package:frontend/features/documents/services/documents_service.dart';
import 'package:riverpod/misc.dart';

import 'fake_documents_repository.dart';

/// Riverpod overrides so shell [DocumentsPage] does not hit the network in tests.
List<Override> documentsProviderOverrides({
  FakeDocumentsRepository? repository,
}) {
  final fake = repository ?? FakeDocumentsRepository();
  return [
    documentsRepositoryProvider.overrideWithValue(fake),
    documentsServiceProvider.overrideWith(
      (ref) => DocumentsService(repository: fake),
    ),
  ];
}
