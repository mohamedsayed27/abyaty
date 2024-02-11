import 'package:abyaty/domain/entities/product_entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.discountPrice,
    required super.beforeDiscountPrice,
    required super.photo,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      discountPrice: json['discount_price'],
      beforeDiscountPrice: json['before_discount_price'],
      photo: json['photo'],
    );
  }
}
