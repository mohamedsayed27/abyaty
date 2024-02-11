import 'package:equatable/equatable.dart';

import '../../../domain/entities/categories/categories_details_entity.dart';

class SubCategoryDetailsModel extends CategoryDetailsEntity {
  const SubCategoryDetailsModel({
    super.id,
    super.name,
    super.photo,
  });

  factory SubCategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryDetailsModel(
      id: json['id'],
      name: json['name'],
    );
  }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['name'] = this.name;
//   data['photo'] = this.photo;
//   return data;
// }
}
