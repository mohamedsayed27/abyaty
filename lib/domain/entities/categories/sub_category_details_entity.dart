import 'package:equatable/equatable.dart';

class SubCategoryDetailsEntity extends Equatable {
  final int? id;
  final String? name;

  const SubCategoryDetailsEntity({
    this.id,
    this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
  ];

// CategoryDetailsEntity.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   name = json['name'];
//   photo = json['photo'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['name'] = this.name;
//   data['photo'] = this.photo;
//   return data;
// }
}
