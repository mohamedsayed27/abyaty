import 'dart:convert';

import 'package:abyaty/core/network/dio_helper.dart';
import 'package:dio/dio.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../../core/parameters/register_parameters.dart';
import '../../models/auth/login_result_model.dart';
import '../../models/auth/register_model.dart';

import 'package:http/http.dart' as http;
abstract class AuthBaseRemoteDataSource{
  Future<LoginModel> login(LoginParameters loginParameters);
  Future<RegisterModel> register(RegisterParameters registerParameters);
}

class AuthRemoteDataSource extends AuthBaseRemoteDataSource{
  final DioHelper dioHelper;

  AuthRemoteDataSource({required this.dioHelper});
  final dio = Dio();
  @override
  Future<LoginModel> login(LoginParameters loginParameters) async {
    try {
      final response = await dioHelper.postData(url: EndPoints.login,data: loginParameters.toMap(),);
      print(response.data);
      return LoginModel.fromJson(response.data,);
    } catch (e) {
      print(e);
      if (e is DioException) {

        print(e.response!.data);
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
    // final url = Uri.parse("https://abyat-test.ocodaserver.com/api/v1/auth/login");
    // final headers = <String, String>{'Content-Type': 'application/json'};
    // final body = jsonEncode(loginParameters.toMap());
    //
    // try {
    //   final response = await http.post(url, headers: headers, body: body);
    //   if (response.statusCode == 200) {
    //     final jsonData = jsonDecode(response.body);
    //     return LoginModel.fromJson(jsonData);
    //   } else {
    //     print('Error on Login: ${response.body}');
    //     throw ErrorException(
    //       baseErrorModel: BaseErrorModel.fromJson(jsonDecode(response.body)),
    //     );
    //   }
    // } catch (e) {
    //   print('Exception: $e');
    //   rethrow;
    // }
  }

  @override
  Future<RegisterModel> register(RegisterParameters registerParameters) async{
    try {
      final response = await dioHelper.postData(url: EndPoints.register,data: registerParameters.toMap(),);
      return RegisterModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data == null) {
          throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
        }
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        throw ErrorException(
          baseErrorModel: BaseErrorModel(message: e.toString()),
        );
      }
    }
  }
  
}