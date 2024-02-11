import 'package:abyaty/domain/entities/attributes_and_options/get_product_attributees_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class GetProductAttributesUseCase
    extends BaseUseCase<GetProductAttributeEntity, int> {
  final ProductBaseRepository productBaseRepository;

  GetProductAttributesUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, GetProductAttributeEntity>> call(
    int parameters,
  ) async {
    return await productBaseRepository.getProductAttributes(
      id: parameters,
    );
  }
}
