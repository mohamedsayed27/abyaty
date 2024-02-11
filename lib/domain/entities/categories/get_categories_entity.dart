import 'package:abyaty/domain/entities/base.dart';

import 'categories_details_entity.dart';

class GetMainCategoryEntity extends BaseResponseEntity {
  final List<CategoryDetailsEntity>? categoryDetailsEntity;

  const GetMainCategoryEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.categoryDetailsEntity,
  });
}
