import 'package:abyaty/data/models/categories/categories_details_model.dart';
import 'package:abyaty/data/models/categories/sub_categories_details_model.dart';
import 'package:abyaty/domain/entities/categories/get_categories_entity.dart';

import '../../../domain/entities/categories/get_sub_category_entity.dart';

class GetSubCategoriesModel extends GetSubCategoryEntity {
  const GetSubCategoriesModel({
    required super.success,
    required super.code,
    required super.message,
    required super.subCategoryDetailsEntity,
  });

  factory GetSubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetSubCategoriesModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      subCategoryDetailsEntity: json["result"].map(
            (e) => SubCategoryDetailsModel.fromJson(e),
      ).toList(),
    );
  }
}
