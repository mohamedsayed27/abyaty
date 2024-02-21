import 'package:equatable/equatable.dart';

class SliderDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? details;
  final String? photo;

  const SliderDetailsEntity({
    required this.id,
    required this.title,
    required this.details,
    required this.photo,
  });



  @override
  List<Object?> get props => [id, title, details, photo];
}
