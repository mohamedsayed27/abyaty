import 'package:abyaty/domain/entities/base.dart';
import 'package:abyaty/domain/entities/product_entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class GetProductDetailsEntity extends BaseResponseEntity {
  final ProductDetailsEntity productDetailsEntity;

  const GetProductDetailsEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.productDetailsEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        productDetailsEntity,
        super.props,
      ];
}

class ProductDetailsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? discountPrice;
  final String? beforeDiscountPrice;
  final String? details;
  final ProductInfoEntity? info;
  final ProductReviewsEntity? reviews;
  final List<ProductEntity>? relatedProducts;

  const ProductDetailsEntity({
    this.id,
    this.name,
    this.discountPrice,
    this.relatedProducts,
    this.beforeDiscountPrice,
    this.details,
    this.info,
    this.reviews,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        discountPrice,
        beforeDiscountPrice,
        details,
        info,
        relatedProducts,
        reviews,
      ];

// factory ProductModel.fromJson(Map<String, dynamic> json) {
//   return ProductModel(
//     id: json['id'],
//     name: json['name'],
//     discountPrice: json['discount_price'],
//     beforeDiscountPrice: json['before_discount_price'],
//     details: json['details'],
//     info: json['info'] != null ? Info.fromJson(json['info']) : null,
//     reviews: json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null,
//     relatedItems: json['related_items'] != null
//         ? (json['related_items'] as List).map((item) => RelatedItem.fromJson(item)).toList()
//         : null,
//     attributes: json['attributes'] != null
//         ? (json['attributes'] as List).map((attr) => Attribute.fromJson(attr)).toList()
//         : null,
//   );
// }
}

class ProductInfoEntity extends Equatable {
  final String? type;
  final String? sku;
  final String? createdAt;
  final List<TagInfoValueEntity>? tags;

  const ProductInfoEntity({
    this.type,
    this.sku,
    this.createdAt,
    this.tags,
  });

  @override
  List<Object?> get props => [
        type,
        sku,
        createdAt,
        tags,
      ];

// factory Info.fromJson(Map<String, dynamic> json) {
//   return Info(
//     type: json['type'],
//     sku: json['sku'],
//     createdAt: json['created_at'],
//     tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
//   );
// }
}
class TagInfoValueEntity extends Equatable{
  final String value;

  const TagInfoValueEntity({required this.value});

  @override
  // TODO: implement props
  List<Object?> get props => [
    value
  ];

}
class ProductReviewsEntity extends Equatable {
  final double? avg;
  final Map<String, int>? ratings;
  final List<ProductReviewEntity>? comments;

  const ProductReviewsEntity({
    this.avg,
    this.ratings,
    this.comments,
  });

  @override
  List<Object?> get props => [
        avg,
        ratings,
        comments,
      ];

// factory Reviews.fromJson(Map<String, dynamic> json) {
//   return Reviews(
//     avg: json['avg']?.toDouble(),
//     ratings: json['ratings'] != null
//         ? Map<String, int>.from(json['ratings'])
//         : {'stars5': 0, 'stars4': 0, 'stars3': 0, 'stars2': 0, 'stars1': 0},
//     comments: json['comments'] != null
//         ? (json['comments'] as List).map((comment) => Review.fromJson(comment)).toList()
//         : null,
//   );
// }
}

class ProductReviewEntity extends Equatable {
  final String? username;
  final String? userPhoto;
  final String? comment;
  final int? rating;

  const ProductReviewEntity({
    this.username,
    this.userPhoto,
    this.comment,
    this.rating,
  });

  @override
  List<Object?> get props => [
        username,
        userPhoto,
        comment,
        rating,
      ];

// factory Review.fromJson(Map<String, dynamic> json) {
//   return Review(
//     username: json['username'],
//     userPhoto: json['user_photo'],
//     comment: json['comment'],
//     rating: json['rating'],
//   );
// }
}


