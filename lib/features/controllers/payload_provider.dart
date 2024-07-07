import 'package:business_manager_timbu/features/models/product_payload.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productPayloadProvider =
    FutureProvider.autoDispose<List<ProductPayLoad>>((ref) async {
  final newtworkRequest = NetworkRequest(dio: Dio());

  return await newtworkRequest.getProducts();
});
