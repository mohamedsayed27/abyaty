import '../../../domain/entities/cart_entity/get_cart_entity.dart';

class GetCartListModel extends GetCartListEntity {
  const GetCartListModel({
    required super.success,
    required super.code,
    required super.message,
    required super.cartEntity,
  });

  factory GetCartListModel.fromJson(Map<String, dynamic> json) {
    return GetCartListModel(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      cartEntity: CartModel.fromJson(
        json['result'],
      ),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
      ];
}

class CartModel extends CartEntity {
  const CartModel({
    super.id,
    super.totalAmount,
    super.cartDetails,
    super.relatedItemsCart,
  });

  @override
  List<Object?> get props => [
        super.props,
      ];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      totalAmount: json['total_amount'],
      cartDetails: json['cartDetails'] != null
          ? (json['cartDetails'] as List)
              .map((item) => CartItemModel.fromJson(item))
              .toList()
          : null,
      relatedItemsCart: json['related_items_cart'] != null
          ? (json['related_items_cart'] as List)
              .map((item) => RelatedItemCartModel.fromJson(item))
              .toList()
          : null,
    );
  }
}

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    super.itemId,
    super.itemName,
    super.attributes,
    super.quantity,
    super.itemPrice,
    super.optionPrice,
    super.totalPrice,
  });

  @override
  List<Object?> get props => [
        super.props,
      ];

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      itemName: json['item_name'],
      attributes: json['attributes'] != null
          ? (json['attributes'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, CartAttributeModel.fromJson(value)))
          : null,
      quantity: json['quantity'],
      itemPrice: json['item_price'],
      optionPrice: json['option_price'],
      totalPrice: json['total_price'],
    );
  }
}

class CartAttributeModel extends CartAttributeEntity {
  const CartAttributeModel({
    super.optionName,
    super.optionPrice,
  });

  @override
  List<Object?> get props => [
        super.props,
      ];

  factory CartAttributeModel.fromJson(Map<String, dynamic> json) {
    return CartAttributeModel(
      optionName: json['option_name'],
      optionPrice: json['option_price']?.toDouble(),
    );
  }
}

class RelatedItemCartModel extends RelatedItemCartEntity {
  const RelatedItemCartModel({
    super.id,
    super.name,
    super.discountPrice,
    super.beforeDiscountPrice,
    super.photo,
  });

  @override
  List<Object?> get props => [
        super.props,
      ];

  factory RelatedItemCartModel.fromJson(Map<String, dynamic> json) {
    return RelatedItemCartModel(
      id: json['id'],
      name: json['name'],
      discountPrice: json['discount_price'],
      beforeDiscountPrice: json['before_discount_price'],
      photo: json['photo'],
    );
  }
}
