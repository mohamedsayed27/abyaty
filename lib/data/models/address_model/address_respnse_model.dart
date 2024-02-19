import 'package:abyaty/data/models/address_model/address_details_model.dart';
import 'package:abyaty/domain/entities/address_entity/address_response_entity.dart';

class AddressResponseModel extends AddressResponseEntity {
  const AddressResponseModel({
    required super.success,
    required super.code,
    required super.message,
    super.addressDetailsEntity,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      addressDetailsEntity: AddressDetailsModel.fromJson(json["result"],),
    );
  }
}
