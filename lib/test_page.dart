import 'package:business_manager_timbu/features/models/product_payload.dart';
import 'package:business_manager_timbu/features/views/personal_widgets.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final payload = ProductPayLoad(
    id: '009kkj9',
    name: 'Nike AirMax',
    price: 1222,
    imageUrl: 'assets/shoe_1.png',
    uniqueId: 'JJAKDN',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ProductItem(productPayLoad: payload)),
    );
  }
}
