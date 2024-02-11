import 'package:abyaty/data/models/address_model/address_details_model.dart';
import 'package:abyaty/domain/entities/profile/user_profile_details_entity.dart';

class ProfileDetailsModel extends ProfileDetailsEntity {
  const ProfileDetailsModel({
    required super.id,
    required super.userName,
    required super.phone,
    required super.gender,
    required super.birthday,
    required super.email,
    required super.addressDetailsEntity,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProfileDetailsModel(
      id: json['id'],
      userName: json['user_name'],
      phone: json['phone'],
      gender: json['gender'],
      birthday: json['birthday'],
      email: json['email'],
      addressDetailsEntity: json['default_address'] != null
          ? AddressDetailsModel.fromJson(
              json['default_address'],
            )
          : null,
    );
  }
}
