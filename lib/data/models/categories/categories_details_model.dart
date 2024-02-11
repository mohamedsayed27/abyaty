import 'package:equatable/equatable.dart';

import '../../../domain/entities/categories/categories_details_entity.dart';

class CategoryDetailsModel extends CategoryDetailsEntity {
  const CategoryDetailsModel({
    super.id,
    super.name,
    super.photo,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
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
