import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/add_to_cart_parameters.dart';
import '../../../core/parameters/filtered_products_parameters.dart';
import '../../../core/parameters/product_review_parameters.dart';
import '../../../domain/entities/attributes_and_options/get_product_attributees_entity.dart';
import '../../../domain/entities/base.dart';
import '../../../domain/entities/cart_entity/get_cart_entity.dart';
import '../../../domain/entities/product_entity/get_all_products_entity.dart';
import '../../../domain/entities/product_entity/get_not_paginated_products_entity.dart';
import '../../../domain/entities/product_entity/product_details_details_entity.dart';
import '../../../domain/repositories/product_base_repository/products_base_repository.dart';
import '../../datasource/remote_datasource/products_remote_data_source.dart';

class ProductRepository extends ProductBaseRepository {
  final ProductBaseRemoteDataSource productBaseRemoteDataSource;

  ProductRepository({
    required this.productBaseRemoteDataSource,
  });

  @override
  Future<Either<ErrorException, BaseResponseEntity>> addProductToFavorite({
    required String id,
  }) async {
    try {
      final response = await productBaseRemoteDataSource.addProductToFavorite(
        id: id,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetAllPaginatedProductsEntity>> getAllProducts(
      {ProductParameters? parameters,}) async {
    try {
      final response = await productBaseRemoteDataSource.getAllProducts(parameters: parameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetProductAttributeEntity>>
      getProductAttributes({
    required int id,
  }) async {
    try {
      final response = await productBaseRemoteDataSource.getProductAttributes(
        id: id,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetProductDetailsEntity>> getProductDetails({
    required int id,
  }) async {
    try {
      final response = await productBaseRemoteDataSource.getProductDetails(
        parameters: id,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetNotPaginatedProductEntity>>
      getTopSellingProducts() async {
    try {
      final response =
          await productBaseRemoteDataSource.getTopSellingProducts();
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetNotPaginatedProductEntity>>
      getWishListProducts() async {
    try {
      final response = await productBaseRemoteDataSource.getWishedProducts();
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, BaseResponseEntity>> removeProductFromFavorite({
    required String id,
  }) async {
    try {
      final response =
          await productBaseRemoteDataSource.removeProductFromFavorite(
        id: id,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, BaseResponseEntity>> reviewProduct({
    required ProductReviewsParameters parameters,
  }) async {
    try {
      final response = await productBaseRemoteDataSource.reviewProduct(
        parameters: parameters,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, BaseResponseEntity>> addProductToCart(
      {required AddToCartParameters addToCartParameters,}) async {
    try {
      final response = await productBaseRemoteDataSource.addProductToCart(
        parameters: addToCartParameters,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetCartListEntity>> getCartList() async {
    try {
      final response = await productBaseRemoteDataSource.getCartList();
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, BaseResponseEntity>> removeProductFromCart(
      {required String id,}) async {
    try {
      final response =
          await productBaseRemoteDataSource.removeProductFromCart(id: id);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }
}
