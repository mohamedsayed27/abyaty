import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/parameters/filtered_products_parameters.dart';
import '../../entities/product_entity/get_all_products_entity.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class GetAllProductUseCase extends BaseUseCase<GetAllPaginatedProductsEntity, ProductParameters?> {
  final ProductBaseRepository productBaseRepository;

  GetAllProductUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, GetAllPaginatedProductsEntity>> call(
      ProductParameters? parameters) async {
    return await productBaseRepository.getAllProducts(
      parameters: parameters,
    );
  }

}
