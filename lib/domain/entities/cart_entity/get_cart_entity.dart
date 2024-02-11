import 'package:abyaty/domain/entities/base.dart';
import 'package:equatable/equatable.dart';

class GetCartListEntity extends BaseResponseEntity {
  final CartEntity cartEntity;

  const GetCartListEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.cartEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
        cartEntity,
      ];
}

class CartEntity extends Equatable {
  final int? id;
  final String? totalAmount;
  final List<CartItemEntity>? cartDetails;
  final List<RelatedItemCartEntity>? relatedItemsCart;

  const CartEntity({
    this.id,
    this.totalAmount,
    this.cartDetails,
    this.relatedItemsCart,
  });

  @override
  List<Object?> get props => [
        id,
        totalAmount,
        cartDetails,
        relatedItemsCart,
      ];

// factory CartResultModel.fromJson(Map<String, dynamic> json) {
//   return CartResultModel(
//     id: json['id'],
//     totalAmount: json['total_amount'],
//     cartDetails: json['cartDetails'] != null
//         ? (json['cartDetails'] as List).map((item) => CartItem.fromJson(item)).toList()
//         : null,
//     relatedItemsCart: json['related_items_cart'] != null
//         ? (json['related_items_cart'] as List).map((item) => RelatedItemCart.fromJson(item)).toList()
//         : null,
//   );
// }
}

class CartItemEntity extends Equatable {
  final int? itemId;
  final String? itemName;
  final Map<String, CartAttributeEntity>? attributes;
  final int? quantity;
  final String? itemPrice;
  final String? optionPrice;
  final String? totalPrice;

  const CartItemEntity({
    this.itemId,
    this.itemName,
    this.attributes,
    this.quantity,
    this.itemPrice,
    this.optionPrice,
    this.totalPrice,
  });

  @override
  List<Object?> get props => [
        itemId,
        itemName,
        attributes,
        quantity,
        itemPrice,
        optionPrice,
        totalPrice,
      ];

// factory CartItem.fromJson(Map<String, dynamic> json) {
//   return CartItem(
//     itemId: json['item_id'],
//     itemName: json['item_name'],
//     attributes: json['attributes'] != null
//         ? (json['attributes'] as Map<String, dynamic>).map((key, value) => MapEntry(key, Attribute.fromJson(value)))
//         : null,
//     quantity: json['quantity'],
//     itemPrice: json['item_price'],
//     optionPrice: json['option_price'],
//     totalPrice: json['total_price'],
//   );
// }
}

class CartAttributeEntity extends Equatable {
  final String? optionName;
  final double? optionPrice;

  const CartAttributeEntity({
    this.optionName,
    this.optionPrice,
  });

  @override
  List<Object?> get props => [
        optionName,
        optionPrice,
      ];

// factory Attribute.fromJson(Map<String, dynamic> json) {
//   return Attribute(
//     optionName: json['option_name'],
//     optionPrice: json['option_price']?.toDouble(),
//   );
// }
}

class RelatedItemCartEntity extends Equatable {
  final int? id;
  final String? name;
  final String? discountPrice;
  final String? beforeDiscountPrice;
  final String? photo;

  const RelatedItemCartEntity({
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

// factory RelatedItemCart.fromJson(Map<String, dynamic> json) {
//   return RelatedItemCart(
//     id: json['id'],
//     name: json['name'],
//     discountPrice: json['discount_price'],
//     beforeDiscountPrice: json['before_discount_price'],
//     photo: json['photo'],
//   );
// }
}
