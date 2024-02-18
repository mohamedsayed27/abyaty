import 'package:abyaty/data/models/products_model/product_model.dart';

import '../../../domain/entities/product_entity/get_not_paginated_products_entity.dart';

class GetNotPaginatedProductsModel extends GetNotPaginatedProductEntity {
  const GetNotPaginatedProductsModel({
    required super.success,
    required super.code,
    required super.message,
    required super.productsList,
  });

  factory GetNotPaginatedProductsModel.fromJson(Map<String, dynamic> json) {
    return GetNotPaginatedProductsModel(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      productsList:
           json['result'] != null
              ? List<ProductModel>.from(
                  json['result'].map(
                    (e) => ProductModel.fromJson(e),
                  ),
                )
              : null,
    );
  }
}
