import 'package:abyaty/domain/entities/address_entity/address_details_entity.dart';
import 'package:abyaty/domain/entities/base.dart';

class AddressResponseEntity extends BaseResponseEntity {
  final AddressDetailsEntity? addressDetailsEntity;

  const AddressResponseEntity({
    required super.success,
    required super.code,
    required super.message,
    this.addressDetailsEntity,
  });
}
