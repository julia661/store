import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:test_app/models/product.model.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/products')
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<List<Product>>> getProducts();

  @Get(path: '/{id}')
  Future<Response<Product>> getProduct(@Path('id') int id);

  @Post()
  Future<Response<Product>> postProduct(
    @Body() Map<String, Product> body,
  );

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://fakestoreapi.com',
      services: [_$ApiService()],
      converter: CustomJsonConverter(
        {
          Product: (Map<String, dynamic> jsonData) =>
              Product.fromJson(jsonData),
        },
      ),
      errorConverter: JsonConverter(),
    );
    return _$ApiService(client);
  }
}

class CustomJsonConverter extends JsonConverter {
  CustomJsonConverter(this.typeToJsonFactoryMap);

  final Map<Type, Function> typeToJsonFactoryMap;  

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap[InnerType]!),
    );
  }

  Type fromJsonData<Type, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as Type;
    } else {
      return jsonParser(jsonMap);
    }
  }
}
