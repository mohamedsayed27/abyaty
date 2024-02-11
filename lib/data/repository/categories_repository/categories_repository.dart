import 'package:abyaty/data/datasource/remote_datasource/categories_datasource.dart';
import 'package:abyaty/domain/entities/categories/get_sub_category_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../domain/entities/categories/get_categories_entity.dart';
import '../../../domain/repositories/categories_base_repository/categories_base_repository.dart';

class CategoriesRepository extends CategoriesBaseRepository {
  final CategoriesRemoteBaseDatasource categoriesBaseRemoteDatasource;

  CategoriesRepository({
    required this.categoriesBaseRemoteDatasource,
  });

  @override
  Future<Either<ErrorException, GetMainCategoryEntity>>
      getMainCategory() async {
    try {
      final response = await categoriesBaseRemoteDatasource.getMainCategories();
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetSubCategoryEntity>> getSubCategory({
    required int categoryId,
  }) async {
    try {
      final response = await categoriesBaseRemoteDatasource.getSubCategories(
          categoryId: categoryId);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }
}
