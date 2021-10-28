import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class InfiniteScrollState {
  final ScrollController controller;
  final List<int> items;
  final int count;
  final bool isLoading;

  const InfiniteScrollState(
      {required this.controller, required this.items, required this.isLoading, required this.count});

  InfiniteScrollState copyWith(
      {ScrollController? controller, List<int>? items, bool? isLoading, int? count}) {
    return InfiniteScrollState(
        controller: controller ?? this.controller,
        items: items ?? this.items,
        count: count ?? this.count,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  bool operator ==(Object other) {
    return other is InfiniteScrollState &&
        other.controller == controller &&
        listEquals(other.items, items) &&
        other.count == count &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode =>
      controller.hashCode ^ hashList(items) ^ isLoading.hashCode ^ count.hashCode;
}
