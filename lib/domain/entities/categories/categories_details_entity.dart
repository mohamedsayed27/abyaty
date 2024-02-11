import 'package:equatable/equatable.dart';

class CategoryDetailsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? photo;

  const CategoryDetailsEntity({
    this.id,
    this.name,
    this.photo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        photo,
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
