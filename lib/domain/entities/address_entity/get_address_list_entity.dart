import 'package:abyaty/domain/entities/base.dart';

import 'address_details_entity.dart';

class GetAddressListEntity extends BaseResponseEntity {
  final List<AddressDetailsEntity>? addressList;

  const GetAddressListEntity({
    required super.success,
    required super.code,
    required super.message,
    this.addressList,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
        addressList,
      ];
}
