import 'package:abyaty/core/network/dio_helper.dart';
import 'package:dio/dio.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../../core/parameters/register_parameters.dart';
import '../../models/auth/login_result_model.dart';
import '../../models/auth/register_model.dart';

abstract class AuthBaseRemoteDataSource{
  Future<LoginModel> login(LoginParameters loginParameters);
  Future<RegisterModel> register(RegisterParameters registerParameters);
}

class AuthRemoteDataSource extends AuthBaseRemoteDataSource{
  final DioHelper dioHelper;

  AuthRemoteDataSource({required this.dioHelper});
  
  @override
  Future<LoginModel> login(LoginParameters loginParameters) async {
    try {
      final response = await dioHelper.postData(url: EndPoints.login,data: loginParameters.toMap(),);
      return LoginModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {

        print(e.response!.statusMessage);
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<RegisterModel> register(RegisterParameters registerParameters) async{
    try {
      final response = await dioHelper.postData(url: EndPoints.register,data: registerParameters.toMap(),);
      return RegisterModel.fromJson(response.data);
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