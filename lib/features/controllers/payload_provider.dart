import 'package:business_manager_timbu/features/models/product_payload.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final productPayloadProvider =
    FutureProvider.autoDispose<List<ProductPayLoad>>((ref) async {
  final newtworkRequest = NetworkRequest(dio: ref.watch(dioProvider));

  return await newtworkRequest.getProducts();
});
