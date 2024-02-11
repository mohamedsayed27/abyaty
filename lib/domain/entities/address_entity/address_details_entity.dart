import 'package:equatable/equatable.dart';

class AddressDetailsEntity extends Equatable {
  final int? id;
  final String? lable;
  final String? area;
  final String? details;
  final String? floorNumber;
  final String? flatNumber;
  final int? isDefault;
  final int? userId;

  const AddressDetailsEntity({
    required this.id,
    required this.lable,
    required this.area,
    required this.details,
    required this.floorNumber,
    required this.flatNumber,
    required this.isDefault,
    required this.userId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    lable,
    area,
    details,
    floorNumber,
    flatNumber,
    isDefault,
    userId,
  ];
}
