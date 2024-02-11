import 'package:abyaty/core/error/error_exception.dart';
import 'package:abyaty/domain/entities/product_entity/product_details_details_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class GetProductDetailsUseCase extends BaseUseCase<GetProductDetailsEntity, int> {
  final ProductBaseRepository productBaseRepository;

  GetProductDetailsUseCase({required this.productBaseRepository});
  @override
  Future<Either<ErrorException, GetProductDetailsEntity>> call(int parameters) async {
    return await productBaseRepository.getProductDetails(
      id: parameters,
    );
  }
}