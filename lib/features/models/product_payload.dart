import 'dart:collection' show MapView;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../common/typedef/app_wide_typedefs.dart';

@immutable
class ProductKey {
  static const productId = "id";
  static const productName = "name";
  static const productPhotos = "photos";
  static const productImageLink = "url";
  static const productPrice = "current_price";
  static const uniqueId = "unique_id";
}

@immutable
class ProductPayLoad extends MapView<String, dynamic> {
  final ProductId id;
  final String name;
  final double price;
  final String imageUrl;
  final String uniqueId;
  ProductPayLoad({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.uniqueId,
  }) : super({
          ProductKey.productId: id,
          ProductKey.productName: name,
          ProductKey.productPrice: price,
          ProductKey.productImageLink: imageUrl,
          ProductKey.uniqueId: uniqueId,
        });

  factory ProductPayLoad.fromJson(Map<String, dynamic> json) {
    return ProductPayLoad(
      id: json[ProductKey.productId] as String,
      name: json[ProductKey.productName] as String,
      price: (json[ProductKey.productPrice][0]['EUR'][0] as num).toDouble(),
      uniqueId: json['unique_id'] as String,
      imageUrl: json[ProductKey.productPhotos].isNotEmpty
          ? json[ProductKey.productPhotos][0][ProductKey.productImageLink]
              as String
          : '',
    );
  }

  @override
  bool operator ==(covariant ProductPayLoad other) =>
      identical(this, other) || (id == other.id && uniqueId == other.uniqueId);

  @override
  int get hashCode => Object.hashAll([id, uniqueId]);

  @override
  String toString() {
    return "Name: $name\tPrice: $price";
  }
}

class NetworkRequest {
  final Dio dio;

  const NetworkRequest({required this.dio});

  static String get getUrl => Uri.https(
        UrlPoints.base,
        UrlPoints.productEndPoint,
        UrlPoints.path,
      ).toString();

  Future<List<ProductPayLoad>> getProducts() async {
    final response = await dio.get(getUrl);

    if (response.statusCode == 200) {
      final List<dynamic> items = response.data['items'];
      return items.map((item) => ProductPayLoad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}

class UrlPoints {
  const UrlPoints._();

  static const base = "api.timbu.cloud";
  static const productEndPoint = '/products';

  static String imageUrl(String imageUrl) => 'https://api.timbu.cloud/images/$imageUrl';

  static const path = <String, dynamic>{
    'organization_id': 'ec1622f31c164c03830c9f203e7c4dba',
    'Appid': 'DBP80AR4G9LAX1I',
    'Apikey': '5fd3c1c9106c4370bddb856d9aecd7b420240706003932140223'
  };
}
