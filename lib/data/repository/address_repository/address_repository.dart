import 'package:abyaty/data/datasource/remote_datasource/address_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/address_parameters.dart';
import '../../../domain/entities/address_entity/address_response_entity.dart';
import '../../../domain/entities/address_entity/get_address_list_entity.dart';
import '../../../domain/entities/base.dart';
import '../../../domain/repositories/address_base_repository/address_base_repository.dart';

class AddressRepository extends AddressBaseRepository {
  final AddressBaseRemoteDatasource addressBaseRemoteDatasource;

  AddressRepository({required this.addressBaseRemoteDatasource});

  @override
  Future<Either<ErrorException, BaseResponseEntity>> deleteAddress({
    required int addressId,
  }) async {
    try {
      final response =
          await addressBaseRemoteDatasource.deleteAddress(addressId: addressId);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, GetAddressListEntity>> getAddressList() async {
    try {
      final response = await addressBaseRemoteDatasource.getAddressList();
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, AddressResponseEntity>> postAddress({
    required AddressParameters addressParameters,
  }) async {
    try {
      final response = await addressBaseRemoteDatasource.postAddress(
          addressParameters: addressParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, AddressResponseEntity>> showAddress({
    required int addressId,
  }) async {
    try {
      final response = await addressBaseRemoteDatasource.showAddress(
        id: addressId,
      );
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, AddressResponseEntity>> updateAddress({
    required AddressParameters addressParameters,
  }) async {
    try {
      final response = await addressBaseRemoteDatasource.updateAddress(
          addressParameters: addressParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, BaseResponseEntity>> updatedDefaultAddress({required int addressId}) async {
    try {
      final response =
      await addressBaseRemoteDatasource.updateDefaultAddress(addressId: addressId);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }
}
