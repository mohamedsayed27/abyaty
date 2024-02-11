import 'package:equatable/equatable.dart';

import 'options_entity.dart';

class AttributesEntity extends Equatable{
  final int? id;
  final String? name;
  final List<OptionEntity>? options;

  const AttributesEntity({
    this.id,
    this.name,
    this.options,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    options,
  ];

// factory Attribute.fromJson(Map<String, dynamic> json) {
//   return Attribute(
//     id: json['attribute_id'],
//     name: json['attribute_name'],
//     options: json['options'] != null&&json['options'].isNotEmpty
//         ? (json['options'] as List).map((option) => Option.fromJson(option)).toList()
//         : null,
//   );
// }
}