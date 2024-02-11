import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../entities/categories/get_categories_entity.dart';
import '../../entities/categories/get_sub_category_entity.dart';

abstract class CategoriesBaseRepository{
  Future<Either<ErrorException,GetMainCategoryEntity>> getMainCategory();
  Future<Either<ErrorException,GetSubCategoryEntity>> getSubCategory({required int categoryId});
}