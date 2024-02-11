import 'package:abyaty/core/parameters/add_to_cart_parameters.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../entities/base.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class AddProductToCartUseCase extends BaseUseCase<BaseResponseEntity, AddToCartParameters> {
  final ProductBaseRepository productBaseRepository;

  AddProductToCartUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, BaseResponseEntity>> call(
      AddToCartParameters parameters) async {
    return await productBaseRepository.addProductToCart(
      addToCartParameters: parameters,
    );
  }

}
