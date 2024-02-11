import 'package:equatable/equatable.dart';

class OptionEntity extends Equatable {
  final int? id;
  final String? name;

  const OptionEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name,
  ];

// factory Option.fromJson(Map<String, dynamic> json) {
//   return Option(
//     id: json['id'],
//     name: json['name'],
//   );
// }
}