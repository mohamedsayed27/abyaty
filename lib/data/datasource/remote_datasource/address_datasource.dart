import 'package:abyaty/core/cache_helper/cache_keys.dart';
import 'package:abyaty/core/cache_helper/shared_pref_methods.dart';
import 'package:abyaty/core/network/dio_helper.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/constants.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/parameters/address_parameters.dart';
import '../../models/address_model/address_respnse_model.dart';
import '../../models/address_model/get_address_list_model.dart';
import '../../models/base_model.dart';

abstract class AddressBaseRemoteDatasource {
  Future<AddressResponseModel> postAddress({
    required AddressParameters addressParameters,
  });

  Future<AddressResponseModel> updateAddress({
    required AddressParameters addressParameters,
  });

  Future<AddressResponseModel> showAddress({required int id});

  Future<GetAddressListModel> getAddressList();

  Future<BaseResponseModel> deleteAddress({
    required int addressId,
  });

  Future<BaseResponseModel> updateDefaultAddress({
    required int addressId,
  });
}

class AddressRemoteDataSource extends AddressBaseRemoteDatasource {
  final DioHelper dioHelper;

  AddressRemoteDataSource({required this.dioHelper});

  @override
  Future<BaseResponseModel> deleteAddress({
    required int addressId,
  }) async {
    try {
      final response = await dioHelper.deleteData(
        url: "${EndPoints.address}/$addressId",
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetAddressListModel> getAddressList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.address,
      );
      return GetAddressListModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<AddressResponseModel> postAddress({
    required AddressParameters addressParameters,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.address,
        data: addressParameters.toJson(),
      );
      return AddressResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<AddressResponseModel> showAddress({required int id}) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.address}/$id",
      );
      return AddressResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<AddressResponseModel> updateAddress({
    required AddressParameters addressParameters,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: "${EndPoints.address}/${addressParameters.id}",
        data: addressParameters.toJson(),
      );
      return AddressResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<BaseResponseModel> updateDefaultAddress({required int addressId}) async {
    try {
      final response = await dioHelper.postData(
        url: "${EndPoints.updateDefaultAddress}/${addressId}",
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }
}
