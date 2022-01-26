// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<List<Product>>> getProducts() {
    final $url = '/products';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Product>, Product>($request);
  }

  @override
  Future<Response<Product>> getProduct(int id) {
    final $url = '/products/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Product, Product>($request);
  }

  @override
  Future<Response<Product>> postProduct(Map<String, Product> body) {
    final $url = '/products';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Product, Product>($request);
  }
}
