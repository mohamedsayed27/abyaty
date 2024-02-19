import 'package:abyaty/data/models/address_model/address_details_model.dart';
import 'package:abyaty/domain/entities/address_entity/get_address_list_entity.dart';

class GetAddressListModel extends GetAddressListEntity {
  const GetAddressListModel({
    required super.success,
    required super.code,
    required super.message,
    super.addressList,
  });

  factory GetAddressListModel.fromJson(Map<String, dynamic> json) {
      List<AddressDetailsModel> result =[];
      json['result'].forEach((v) {
        result.add(AddressDetailsModel.fromJson(v));
      });
    return GetAddressListModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      addressList: result,
    );
  }
}
