import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BuilderScrollState {
  final List<int> items;
  final int count;

  const BuilderScrollState({required this.items, required this.count});

  BuilderScrollState copyWith(
      {ScrollController? controller,
      List<int>? items,
      bool? isLoading,
      int? count}) {
    return BuilderScrollState(
        items: items ?? this.items, count: count ?? this.count);
  }

  @override
  bool operator ==(Object other) {
    return other is BuilderScrollState &&
        listEquals(other.items, items) &&
        other.count == count;
  }

  @override
  int get hashCode => hashList(items) ^ count.hashCode;
}
