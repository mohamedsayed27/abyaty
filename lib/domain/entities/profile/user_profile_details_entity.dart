import 'package:abyaty/domain/entities/address_entity/address_details_entity.dart';
import 'package:equatable/equatable.dart';

class ProfileDetailsEntity extends Equatable{
  final int? id;
  final String? userName;
  final String? phone;
  final String? gender;
  final String? birthday;
  final String? email;
  final AddressDetailsEntity? addressDetailsEntity;

  const ProfileDetailsEntity({
    required this.id,
    required this.userName,
    required this.phone,
    required this.gender,
    required this.birthday,
    required this.email,
    required this.addressDetailsEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    userName,
    phone,
    gender,
    birthday,
    email,
    addressDetailsEntity,
  ];

// ProfileDetailsEntity.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   userName = json['user_name'];
//   phone = json['phone'];
//   gender = json['gender'];
//   birthday = json['birthday'];
//   email = json['email'];
//   addressDetailsEntity = json['default_address'] != null
//       ? new AddressDetailsEntity().fromJson(json['default_address'])
//       : null;
// }
}
