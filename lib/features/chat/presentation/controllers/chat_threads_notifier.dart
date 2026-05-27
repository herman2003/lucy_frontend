import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/router/lucy_route_paths.dart';
import '../../domain/entities/chat_thread.dart';
import '../../domain/exceptions/chat_exception.dart';
import '../../domain/providers/chat_provider.dart';
import 'chat_threads_state.dart';

part 'chat_threads_notifier.g.dart';

@riverpod
class ChatThreadsNotifier extends _$ChatThreadsNotifier {
  @override
  ChatThreadsState build() => const ChatThreadsState();

  Future<void> bootstrap({String? initialChatId}) async {
    state = state.copyWith(isLoading: true, errorCode: null);
    try {
      final service = ref.read(chatServiceProvider);
      final threads = await service.listThreads();
      final eligibility = await service.getEligibility();
      state = state.copyWith(
        isLoading: false,
        threads: threads,
        eligibility: eligibility,
        selectedChatId: _resolveInitialSelection(threads, initialChatId),
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  void selectThread(String chatId, BuildContext context) {
    state = state.copyWith(selectedChatId: chatId, errorCode: null);
    context.go(LucyRoutePaths.chatThread(chatId));
  }

  Future<void> createThread(BuildContext context) async {
    try {
      final thread = await ref.read(chatServiceProvider).createThread();
      state = state.copyWith(
        threads: [thread, ...state.threads],
        selectedChatId: thread.id,
      );
      if (context.mounted) {
        context.go(LucyRoutePaths.chatThread(thread.id));
      }
    } catch (error) {
      state = state.copyWith(errorCode: _errorCode(error));
    }
  }

  String? _resolveInitialSelection(
    List<ChatThread> threads,
    String? initialChatId,
  ) {
    if (initialChatId != null &&
        threads.any((thread) => thread.id == initialChatId)) {
      return initialChatId;
    }
    if (threads.isEmpty) {
      return null;
    }
    return threads.first.id;
  }

  String _errorCode(Object error) {
    if (error is ChatException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
