import 'package:abyaty/core/error/error_exception.dart';
import 'package:abyaty/domain/repositories/categories_base_repository/categories_base_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../entities/categories/get_categories_entity.dart';

class GetCategoriesListUseCase
    extends BaseUseCase<GetMainCategoryEntity, NoParameters> {
  final CategoriesBaseRepository categoriesBaseRepository;

  GetCategoriesListUseCase({required this.categoriesBaseRepository});

  @override
  Future<Either<ErrorException, GetMainCategoryEntity>> call(
    NoParameters parameters,
  ) async {
    return await categoriesBaseRepository.getMainCategory();
  }
}
