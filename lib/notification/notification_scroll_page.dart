import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_test/notification/notification_scroll_controller.dart';

class NotificationScrollPage extends ConsumerWidget {
  const NotificationScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '스크롤 횟수 : ${ref.watch(notificationScrollControllerProvider.select((value) => value.count))}'),
          actions: [
            GestureDetector(
                onTap: () async {
                  ref.refresh(notificationScrollControllerProvider);
                },
                child: const Icon(Icons.refresh))
          ],
        ),
        body: ref.watch(notificationScrollControllerProvider
                .select((value) => value.items.isNotEmpty))
            ? NotificationListener<ScrollNotification>(
                onNotification: ref.watch(notificationScrollControllerProvider.notifier).handleScrollNotification,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  controller: ref.watch(notificationScrollControllerProvider
                      .select((value) => value.controller)),
                  itemBuilder: (context, index) => Container(
                      height: 30,
                      color: Color.fromRGBO(index * 30 % 255, index * 14 % 255,
                          index * 39 % 255, 1.0)),
                  itemCount: ref.watch(notificationScrollControllerProvider
                      .select((value) => value.items.length)),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
