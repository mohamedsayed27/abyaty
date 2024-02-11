import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../entities/product_entity/get_not_paginated_products_entity.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class GetFavoriteProductsUseCase extends BaseUseCase<GetNotPaginatedProductEntity, NoParameters> {
  final ProductBaseRepository productBaseRepository;

  GetFavoriteProductsUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, GetNotPaginatedProductEntity>> call(NoParameters parameters) async {
    return await productBaseRepository.getWishListProducts();
  }

}