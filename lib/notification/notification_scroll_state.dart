import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class NotificationScrollState {
  final ScrollController controller;
  final List<int> items;
  final int count;
  final bool isLoading;

  const NotificationScrollState(
      {required this.controller, required this.items, required this.isLoading, required this.count});

  NotificationScrollState copyWith(
      {ScrollController? controller, List<int>? items, bool? isLoading, int? count}) {
    return NotificationScrollState(
        controller: controller ?? this.controller,
        items: items ?? this.items,
        count: count ?? this.count,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationScrollState &&
        other.controller == controller &&
        listEquals(other.items, items) &&
        other.count == count &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode =>
      controller.hashCode ^ hashList(items) ^ isLoading.hashCode ^ count.hashCode;
}
