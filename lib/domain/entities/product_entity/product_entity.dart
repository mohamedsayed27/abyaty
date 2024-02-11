import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? name;
  final String? discountPrice;
  final String? beforeDiscountPrice;
  final String? photo;

  const ProductEntity({
    this.id,
    this.name,
    this.discountPrice,
    this.beforeDiscountPrice,
    this.photo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        discountPrice,
        beforeDiscountPrice,
        photo,
      ];

// factory ProductModel.fromJson(Map<String, dynamic> json) {
//   return ProductModel(
//     id: json['id'],
//     name: json['name'],
//     discountPrice: json['discount_price'],
//     beforeDiscountPrice: json['before_discount_price'],
//     photo: json['photo'],
//   );
// }
}
