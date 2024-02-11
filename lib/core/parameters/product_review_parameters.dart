import 'package:equatable/equatable.dart';

class ProductReviewsParameters extends Equatable {
  final int productId;
  final int rating;
  final String comment;

  const ProductReviewsParameters({
    required this.productId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
        "item_id": productId,
        "rating": rating,
        "review": comment,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        productId,
        rating,
        comment,
      ];
}
