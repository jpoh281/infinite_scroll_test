import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_test/builder_item/builder_scroll_controller.dart';

class BuilderScrollPage extends ConsumerWidget {
  const BuilderScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '스크롤 횟수 : ${ref.watch(builderScrollControllerProvider.select((value) => value.count))}'),
          actions: [
            GestureDetector(
                onTap: () async {
                  ref.refresh(builderScrollControllerProvider);
                },
                child: const Icon(Icons.refresh))
          ],
        ),
        body: ref.watch(builderScrollControllerProvider
                .select((value) => value.items.isNotEmpty))
            ? ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index ==
                      ref.watch(builderScrollControllerProvider
                              .select((value) => value.items.length)) -
                          1) {
                    ref
                        .watch(builderScrollControllerProvider.notifier)
                        .fetchMoreItems();
                  }
                  return Container(
                      height: 30,
                      color: Color.fromRGBO(index * 30 % 255, index * 14 % 255,
                          index * 39 % 255, 1.0));
                },
                itemCount: ref.watch(builderScrollControllerProvider
                    .select((value) => value.items.length)),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
