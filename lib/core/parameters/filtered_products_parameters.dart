import 'package:equatable/equatable.dart';

class ProductParameters extends Equatable{
  final int? perPage;
  final int? categoryId;
  final int? subcategoryId;
  final double? priceFrom;
  final double? priceTo;
  final double? discount;
  final double? ratingFrom;
  final double? ratingTo;
  final int? page;

  const ProductParameters({
    this.perPage,
    this.categoryId,
    this.subcategoryId,
    this.priceFrom,
    this.priceTo,
    this.discount,
    this.ratingFrom,
    this.ratingTo,
    this.page,
  });

  Map<String, dynamic> toJson() {
    return {
      'per_page': perPage,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'price_from': priceFrom,
      'price_to': priceTo,
      'discount': discount,
      'rating_from': ratingFrom,
      'rating_to': ratingTo,
      'page': page,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    perPage,
    categoryId,
    subcategoryId,
    priceFrom,
    priceTo,
    discount,
    ratingFrom,
    ratingTo,
    page,
  ];
}
