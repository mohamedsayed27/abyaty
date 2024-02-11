import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/parameters/product_review_parameters.dart';
import '../../entities/base.dart';
import '../../repositories/product_base_repository/products_base_repository.dart';

class ReviewProductUseCase extends BaseUseCase<BaseResponseEntity, ProductReviewsParameters> {
  final ProductBaseRepository productBaseRepository;

  ReviewProductUseCase({required this.productBaseRepository});

  @override
  Future<Either<ErrorException, BaseResponseEntity>> call(
      ProductReviewsParameters parameters) async {
    return await productBaseRepository.reviewProduct(
      parameters: parameters,
    );
  }

}
