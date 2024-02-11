import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/address_parameters.dart';
import '../../entities/address_entity/address_response_entity.dart';
import '../../entities/address_entity/get_address_list_entity.dart';
import '../../entities/base.dart';

abstract class AddressBaseRepository {
  Future<Either<ErrorException, AddressResponseEntity>> postAddress({
    required AddressParameters addressParameters,
  });

  Future<Either<ErrorException, AddressResponseEntity>> updateAddress({
    required AddressParameters addressParameters,
  });

  Future<Either<ErrorException, AddressResponseEntity>> showAddress({
    required int addressId,
  });

  Future<Either<ErrorException, GetAddressListEntity>> getAddressList();

  Future<Either<ErrorException, BaseResponseEntity>> deleteAddress({
    required int addressId,
  });

  Future<Either<ErrorException, BaseResponseEntity>> updatedDefaultAddress({
    required int addressId,
  });
}
