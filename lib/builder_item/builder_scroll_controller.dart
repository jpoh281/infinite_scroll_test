import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_test/builder_item/builder_scroll_state.dart';

final builderScrollControllerProvider = StateNotifierProvider.autoDispose<
    BuilderScrollController, BuilderScrollState>((ref) {
  return BuilderScrollController(const BuilderScrollState(
    items: [],
    count: 0,
  ));
});

class BuilderScrollController extends StateNotifier<BuilderScrollState> {
  BuilderScrollController(BuilderScrollState state) : super(state) {
    fetchItems();
  }

  Future<void> fetchItems() async {
    await Future.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(items: List.generate(4, (index) => index), count: 1);
  }

  Future<void> fetchMoreItems() async {
    if(mounted) {
      await Future.delayed(const Duration(milliseconds: 300));
      state = state.copyWith(
          items: state.items
            ..addAll(List.generate(4, (index) => state.items.length + index)),
          count: state.count + 1);
    }
  }
}
