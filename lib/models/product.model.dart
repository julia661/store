import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.model.freezed.dart';
part 'product.model.g.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required int id,
    required String title,
    required double price,
    String? description,
    required String category,
    String? image,
    required Rating rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Rating with _$Rating {
  const Rating._();
  
  factory Rating({
    @Default(0) double rate,
    @Default(0) int count,
  }) = _Rating;

   factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);
}
