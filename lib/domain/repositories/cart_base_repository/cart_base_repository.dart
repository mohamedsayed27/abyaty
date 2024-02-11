
import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/add_to_cart_parameters.dart';
import '../../../data/models/base_model.dart';
import '../../entities/cart_entity/get_cart_entity.dart';

abstract class CartBaseRepository {
  Future<Either<ErrorException, GetCartListEntity>> getCartItems();

  Future<Either<ErrorException, BaseResponseModel>> addToCart({
    required AddToCartParameters addToCartParameters,
  });

  Future<Either<ErrorException, BaseResponseModel>> deleteFromCart({
    required int productId,
  });
}
