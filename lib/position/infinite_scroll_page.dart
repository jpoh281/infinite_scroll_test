import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_test/position/infinite_scroll_controller.dart';

class InfiniteScrollPage extends ConsumerWidget {
  const InfiniteScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '스크롤 횟수 : ${ref.watch(infiniteScrollControllerProvider.select((value) => value.count))}'),
          actions: [
            GestureDetector(
                onTap: () async {
                  ref.refresh(infiniteScrollControllerProvider);
                },
                child: const Icon(Icons.refresh))
          ],
        ),
        body: ref.watch(infiniteScrollControllerProvider
                .select((value) => value.items.isNotEmpty))
            ? ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: ref.watch(infiniteScrollControllerProvider
                    .select((value) => value.controller)),
                itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Color.fromRGBO(index * 30 % 255, index * 14 % 255,
                        index * 39 % 255, 1.0)),
                itemCount: ref.watch(infiniteScrollControllerProvider
                    .select((value) => value.items.length)),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
