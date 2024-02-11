import 'package:abyaty/domain/entities/cart_entity/get_cart_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class GetCartListUseCase extends BaseUseCase<GetCartListEntity, NoParameters> {
  final ProductBaseRepository productBaseRepository;

  GetCartListUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, GetCartListEntity>> call(NoParameters parameters) async {
    return await productBaseRepository.getCartList();
  }

}