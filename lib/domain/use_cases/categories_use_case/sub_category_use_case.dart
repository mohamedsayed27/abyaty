import 'package:abyaty/core/error/error_exception.dart';
import 'package:abyaty/domain/repositories/categories_base_repository/categories_base_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../entities/categories/get_categories_entity.dart';
import '../../entities/categories/get_sub_category_entity.dart';

class GetSubCategoriesListUseCase
    extends BaseUseCase<GetSubCategoryEntity, int> {
  final CategoriesBaseRepository categoriesBaseRepository;

  GetSubCategoriesListUseCase({required this.categoriesBaseRepository});

  @override
  Future<Either<ErrorException, GetSubCategoryEntity>> call(
    int parameters,
  ) async {
    return await categoriesBaseRepository.getSubCategory(
      categoryId: parameters,
    );
  }
}
