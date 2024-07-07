import 'dart:developer';

import 'package:business_manager_timbu/common/extentions/text_extention.dart';
import 'package:business_manager_timbu/features/controllers/payload_provider.dart';
import 'package:business_manager_timbu/features/models/product_payload.dart';
import 'package:business_manager_timbu/features/views/personal_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants/sizes.dart';

class ProductView extends ConsumerWidget {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(productPayloadProvider);
    return Scaffold(
      body: data.when(
        data: (data) => RefreshIndicator.adaptive(
          displacement: 50,
          onRefresh: () async {
            // ignore: unused_result
            ref.refresh(productPayloadProvider.future);
            return Future.delayed(const Duration(seconds: 2));
          },
          child: customGridView(data: data),
        ),
        error: (_, __) => customErrorView(),
        loading: customLoadingView,
      ),
    );
  }
}

Widget customGridView({required List<ProductPayLoad> data}) {
  for (var element in data) {
    log(element.toString());
  }
  return CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        toolbarHeight: CSizes.appBarHeight,
        centerTitle: true,
        title: "Products".toText(),
        floating: false,
        pinned: true,
      ),
      SliverPadding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 15),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var payload = data[index];
              return ProductItem(productPayLoad: payload);
            },
            // childCount: ProductDetails.productImages.length,
            childCount: data.length,
          ),
        ),
      ),
    ],
  );
}

Widget customErrorView() {
  return Column(
    children: ['Sorry an error occured on loading products'.toText()],
  );
}

Widget customLoadingView() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
