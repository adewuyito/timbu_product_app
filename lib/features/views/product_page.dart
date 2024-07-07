import 'package:business_manager_timbu/common/extentions/text_extention.dart';
import 'package:business_manager_timbu/features/controllers/payload_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../test_page.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var output = ref.watch(productPayloadProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TestPage(),
          ),
        );
      }),
      body: output.when(
        data: (data) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              var item = data[index];
              return ListTile(
                title: item.name.toText(),
              );
            },
          );
        },
        error: (_, __) {
          return const Icon(
            Icons.error,
            color: Colors.red,
          );
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
