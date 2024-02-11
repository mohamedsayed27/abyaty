import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../entities/base.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class RemoveProductFromCartUseCase extends BaseUseCase<BaseResponseEntity, int> {
  final ProductBaseRepository productBaseRepository;

  RemoveProductFromCartUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, BaseResponseEntity>> call(
      int parameters) async {
    return await productBaseRepository.removeProductFromCart(
      id: parameters.toString(),
    );
  }

}
