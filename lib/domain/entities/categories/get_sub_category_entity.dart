import 'package:abyaty/domain/entities/base.dart';
import 'package:abyaty/domain/entities/categories/sub_category_details_entity.dart';

import 'categories_details_entity.dart';

class GetSubCategoryEntity extends BaseResponseEntity {
  final List<SubCategoryDetailsEntity>? subCategoryDetailsEntity;

  const GetSubCategoryEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.subCategoryDetailsEntity,
  });
}
