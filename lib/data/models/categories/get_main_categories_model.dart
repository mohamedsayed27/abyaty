import 'package:abyaty/data/models/categories/categories_details_model.dart';
import 'package:abyaty/domain/entities/categories/get_categories_entity.dart';

class GetMainCategoriesModel extends GetMainCategoryEntity {
  const GetMainCategoriesModel({
    required super.success,
    required super.code,
    required super.message,
    required super.categoryDetailsEntity,
  });

  factory GetMainCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetMainCategoriesModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      categoryDetailsEntity: json["result"].isNotEmpty && json["result"] != null
          ? List<CategoryDetailsModel>.from(json["result"].map(
              (e) => CategoryDetailsModel.fromJson(e),
            ))
          : null,
    );
  }
}
