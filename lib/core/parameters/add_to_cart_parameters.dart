import 'package:equatable/equatable.dart';

class AddToCartParameters extends Equatable {
  final int productId;
  final String optionsId;
  final String attributesId;
  final int quantity;

  const AddToCartParameters({
    required this.productId,
    required this.attributesId,
    required this.optionsId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    "item_id": productId,
    "options_ids": optionsId,
    "attribute_ids": attributesId,
    "quantity": quantity,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    productId,
    optionsId,
    attributesId,
    quantity,
  ];
}
