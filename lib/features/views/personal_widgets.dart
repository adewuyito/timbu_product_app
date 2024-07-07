import 'package:business_manager_timbu/features/models/product_payload.dart';
import 'package:flutter/widgets.dart';

class ProductList extends StatelessWidget {
  final ProductPayLoad data;

  const ProductList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          data.imageUrl,
          fit: BoxFit.contain,
        ),
        Column(
          children: [],
        )
      ],
    );
  }
}
