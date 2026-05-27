import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/router/lucy_route_paths.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../domain/entities/chat_thread.dart';
import '../../domain/exceptions/chat_exception.dart';
import '../../domain/providers/chat_mirror_provider.dart';
import '../../domain/providers/chat_provider.dart';
import '../../utils/chat_network_utils.dart';
import 'chat_threads_state.dart';

part 'chat_threads_notifier.g.dart';

@riverpod
class ChatThreadsNotifier extends _$ChatThreadsNotifier {
  @override
  ChatThreadsState build() => const ChatThreadsState();

  Future<void> bootstrap({String? initialChatId}) async {
    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    if (uid == null) {
      return;
    }

    state = state.copyWith(isLoading: true, errorCode: null, isOffline: false);

    final mirrorService = ref.read(chatMirrorServiceProvider);
    final cachedMirror = await mirrorService.load(uid);
    if (cachedMirror != null && cachedMirror.threads.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        threads: cachedMirror.threads,
        selectedChatId: _resolveInitialSelection(
          cachedMirror.threads,
          initialChatId ?? cachedMirror.lastActiveChatId,
        ),
      );
    }

    try {
      final service = ref.read(chatServiceProvider);
      final threads = await service.listThreads();
      final eligibility = await service.getEligibility();
      final selectedChatId = _resolveInitialSelection(
        threads,
        initialChatId ?? state.selectedChatId,
      );

      await mirrorService.saveThreads(
        uid: uid,
        threads: threads,
        lastActiveChatId: selectedChatId,
        base: cachedMirror,
      );

      state = state.copyWith(
        isLoading: false,
        threads: threads,
        eligibility: eligibility,
        selectedChatId: selectedChatId,
        isOffline: false,
        errorCode: null,
      );
    } catch (error) {
      if (ChatNetworkUtils.isOfflineError(error) &&
          (cachedMirror?.threads.isNotEmpty ?? false)) {
        state = state.copyWith(isLoading: false, isOffline: true, errorCode: null);
        return;
      }
      state = state.copyWith(
        isLoading: false,
        errorCode: _errorCode(error),
        isOffline: ChatNetworkUtils.isOfflineError(error),
      );
    }
  }

  void selectThread(String chatId, BuildContext context) {
    state = state.copyWith(selectedChatId: chatId, errorCode: null);
    context.go(LucyRoutePaths.chatThread(chatId));
    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    if (uid == null) {
      return;
    }
    final mirrorService = ref.read(chatMirrorServiceProvider);
    mirrorService.saveThreads(
      uid: uid,
      threads: state.threads,
      lastActiveChatId: chatId,
    );
  }

  Future<void> createThread(BuildContext context) async {
    if (state.isOffline || state.eligibility?.canChat == false) {
      return;
    }
    try {
      final thread = await ref.read(chatServiceProvider).createThread();
      final threads = [thread, ...state.threads];
      state = state.copyWith(
        threads: threads,
        selectedChatId: thread.id,
      );
      final uid = ref.read(authRepositoryProvider).currentUser?.uid;
      if (uid != null) {
        await ref.read(chatMirrorServiceProvider).saveThreads(
          uid: uid,
          threads: threads,
          lastActiveChatId: thread.id,
        );
      }
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

  void setOffline(bool isOffline) {
    state = state.copyWith(isOffline: isOffline);
  }

  String _errorCode(Object error) {
    if (error is ChatException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
