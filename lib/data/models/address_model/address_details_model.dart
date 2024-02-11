import 'package:abyaty/domain/entities/address_entity/address_details_entity.dart';

class AddressDetailsModel extends AddressDetailsEntity {
  const AddressDetailsModel({
    super.id,
    super.lable,
    super.area,
    super.details,
    super.floorNumber,
    super.flatNumber,
    super.isDefault,
    super.userId,
  });

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddressDetailsModel(
      id: json["id"],
      lable: json["lable"],
      area: json["area"],
      details: json["details"],
      floorNumber: json["floor_number"],
      flatNumber: json["flat_number"],
      isDefault: json["is_default"],
      userId: json["user_id"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lable'] = lable;
    data['label'] = lable;
    data['area'] = area;
    data['details'] = details;
    data['floor_number'] = floorNumber;
    data['flat_number'] = flatNumber;
    data['is_default'] = isDefault;
    data['user_id'] = userId;
    return data;
  }
}
