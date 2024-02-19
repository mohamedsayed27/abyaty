import 'package:abyaty/domain/entities/address_entity/address_details_entity.dart';

class AddressParameters extends AddressDetailsEntity {
  const AddressParameters({
    required super.id,
    required super.lable,
    required super.area,
    required super.details,
    required super.floorNumber,
    required super.flatNumber,
    required super.isDefault,
    required super.userId,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(id!=null)data['id'] = id;
    data['label'] = lable;
    data['area'] = area;
    data['details'] = details;
    data['floor_number'] = floorNumber;
    data['flat_number'] = flatNumber;
    data['is_default'] = isDefault;
    // data['user_id'] = userId;
    return data;
  }
}
