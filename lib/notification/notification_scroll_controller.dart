import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_test/notification/notification_scroll_state.dart';

final notificationScrollControllerProvider = StateNotifierProvider.autoDispose<
    NotificationScrollContoller, NotificationScrollState>((ref) {
  return NotificationScrollContoller(NotificationScrollState(
    controller: ScrollController(),
    items: const [],
    count: 0,
    isLoading: false,
  ));
});

class NotificationScrollContoller
    extends StateNotifier<NotificationScrollState> {
  NotificationScrollContoller(NotificationScrollState state) : super(state) {
    fetchItems();
  }

  Future<void> fetchItems() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(
        isLoading: false, items: List.generate(4, (index) => index), count: 1);
  }

  Future<void> fetchMoreItems() async {
    if (mounted) {
      state = state.copyWith(isLoading: true);
      await Future.delayed(const Duration(milliseconds: 300));
      state = state.copyWith(
          isLoading: false,
          items: state.items
            ..addAll(List.generate(4, (index) => state.items.length + index)),
          count: state.count + 1);
    }
  }

  @override
  void dispose() {
    state.controller.dispose();
    super.dispose();
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (state.isLoading) return false;
    if(notification.metrics.extentAfter == 0){
      fetchMoreItems();
    }
    return false;
  }
}
