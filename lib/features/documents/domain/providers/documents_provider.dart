import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/documents_data_provider.dart';
import '../../services/documents_service.dart';
import '../repositories/documents_repository.dart';

part 'documents_provider.g.dart';

@Riverpod(keepAlive: true)
DocumentsRepository documentsRepository(Ref ref) {
  return ref.watch(documentsRepositoryImplProvider);
}

@Riverpod(keepAlive: true)
DocumentsService documentsService(Ref ref) {
  return DocumentsService(repository: ref.watch(documentsRepositoryProvider));
}
