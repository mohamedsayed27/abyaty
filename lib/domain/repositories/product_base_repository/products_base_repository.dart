import 'package:abyaty/core/parameters/add_to_cart_parameters.dart';
import 'package:abyaty/domain/entities/cart_entity/get_cart_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/filtered_products_parameters.dart';
import '../../../core/parameters/product_review_parameters.dart';
import '../../../domain/entities/attributes_and_options/get_product_attributees_entity.dart';
import '../../../domain/entities/base.dart';
import '../../../domain/entities/product_entity/get_all_products_entity.dart';
import '../../../domain/entities/product_entity/get_not_paginated_products_entity.dart';
import '../../../domain/entities/product_entity/product_details_details_entity.dart';

abstract class ProductBaseRepository {
  Future<Either<ErrorException, GetAllPaginatedProductsEntity>> getAllProducts({
    ProductParameters? parameters,
  });

  Future<Either<ErrorException, GetProductDetailsEntity>> getProductDetails({
    required int id,
  });

  Future<Either<ErrorException, GetNotPaginatedProductEntity>>
      getTopSellingProducts();

  Future<Either<ErrorException, GetNotPaginatedProductEntity>>
      getWishListProducts();

  Future<Either<ErrorException, GetProductAttributeEntity>>
      getProductAttributes({
    required int id,
  });

  Future<Either<ErrorException, BaseResponseEntity>> reviewProduct({
    required ProductReviewsParameters parameters,
  });

  Future<Either<ErrorException, BaseResponseEntity>> addProductToFavorite({
    required String id,
  });

  Future<Either<ErrorException, BaseResponseEntity>> removeProductFromFavorite({
    required String id,
  });

  Future<Either<ErrorException, BaseResponseEntity>> addProductToCart({
    required AddToCartParameters addToCartParameters,
  });

  Future<Either<ErrorException, BaseResponseEntity>> removeProductFromCart({
    required String id,
  });

  Future<Either<ErrorException, GetCartListEntity>>
  getCartList();
}
