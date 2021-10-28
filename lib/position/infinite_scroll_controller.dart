import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_test/position/infinite_scroll_state.dart';

final infiniteScrollControllerProvider = StateNotifierProvider.autoDispose<
    InfiniteScrollController, InfiniteScrollState>((ref) {
  return InfiniteScrollController(InfiniteScrollState(
    controller: ScrollController(),
    items: const [],
    count: 0,
    isLoading: false,
  ));
});

class InfiniteScrollController extends StateNotifier<InfiniteScrollState> {
  InfiniteScrollController(InfiniteScrollState state) : super(state) {
    fetchItems();
    state.controller.addListener(_checkScroll);
  }

  Future<void> fetchItems() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(
        isLoading: false, items: List.generate(4, (index) => index), count: 1);
  }

  Future<void> fetchMoreItems() async {
    if(mounted) {
      state = state.copyWith(isLoading: true);
      await Future.delayed(const Duration(milliseconds: 300));
      state = state.copyWith(
          isLoading: false,
          items: state.items
            ..addAll(List.generate(4, (index) => state.items.length + index)),
          count: state.count + 1);
    }
  }

  _checkScroll() {
    if (state.isLoading) return;
    if (state.controller.position.pixels >
        state.controller.position.maxScrollExtent - 400) {
      print("position pass");
      fetchMoreItems();
    }
  }

  @override
  void dispose() {
    print('dispose');
    state.controller.removeListener(_checkScroll);
    state.controller.dispose();
    super.dispose();
  }
}
