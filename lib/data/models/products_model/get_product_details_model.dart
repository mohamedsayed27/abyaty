import 'package:abyaty/data/models/products_model/product_model.dart';

import '../../../domain/entities/product_entity/product_details_details_entity.dart';

class GetProductDetailsModel extends GetProductDetailsEntity {
  const GetProductDetailsModel({
    required super.success,
    required super.code,
    required super.message,
    required super.productDetailsEntity,
  });

  factory GetProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return GetProductDetailsModel(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      productDetailsEntity: ProductDetailsModel.fromJson(json['result']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
      ];
}

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({
    required super.id,
    required super.name,
    required super.discountPrice,
    required super.beforeDiscountPrice,
    required super.details,
    required super.info,
    required super.reviews,
    required super.relatedProducts,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      name: json['name'],
      discountPrice: json['discount_price'],
      beforeDiscountPrice: json['before_discount_price'],
      details: json['details'],
      relatedProducts:
          json['related_items'].isNotEmpty && json['related_items'] != null
              ? List<ProductModel>.from(
                  json['related_items'].map(
                    (e) => ProductModel.fromJson(e),
                  ),
                )
              : null,
      info:
          json['info'] != null ? ProductInfoModel.fromJson(json['info']) : null,
      reviews: json['reviews'] != null
          ? ProductReviewsModel.fromJson(json['reviews'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        super.props,
      ];
}

class ProductInfoModel extends ProductInfoEntity {
  const ProductInfoModel({
    required super.type,
    required super.sku,
    required super.createdAt,
    required super.tags,
  });

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) {
    return ProductInfoModel(
      type: json['type'],
      sku: json['sku'],
      createdAt: json['created_at'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
    );
  }

  @override
  List<Object?> get props => [
        super.props,
      ];
}

class ProductReviewsModel extends ProductReviewsEntity {
  const ProductReviewsModel({
    required super.avg,
    required super.ratings,
    required super.comments,
  });

  factory ProductReviewsModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewsModel(
      avg: json['avg']?.toDouble(),
      ratings: json['ratings'] != null
          ? Map<String, int>.from(json['ratings'])
          : {'stars5': 0, 'stars4': 0, 'stars3': 0, 'stars2': 0, 'stars1': 0},
      comments: json['comments'] != null
          ? (json['comments'] as List)
              .map((comment) => ProductReviewModel.fromJson(comment))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [
        super.props,
      ];
}

class ProductReviewModel extends ProductReviewEntity {
  const ProductReviewModel({
    required super.username,
    required super.userPhoto,
    required super.comment,
    required super.rating,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      username: json['username'],
      userPhoto: json['user_photo'],
      comment: json['comment'],
      rating: json['rating'],
    );
  }

  @override
  List<Object?> get props => [
        super.props,
      ];
}
