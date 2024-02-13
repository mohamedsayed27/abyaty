import 'package:dio/dio.dart';
import '../cache_helper/cache_keys.dart';
import '../cache_helper/shared_pref_methods.dart';
import '../constants/constants.dart';
import 'api_end_points.dart';

class DioHelper {
  static late Dio dio;

   static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

   Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
  }) async {

     token = await CacheHelper.getData(key: CacheKeys.token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'x-localization': lang,
      if (token != null) "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.get(url, queryParameters: query,);
  }

   Future<Response> postData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'ar'
  }) async {
     token = await CacheHelper.getData(key: CacheKeys.token);
     print(token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'x-localization': lang,
      "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.post(url, queryParameters: query, data: data);

    // return ;
  }

   Future<Response> deleteData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'ar',
  }) async {
     token = await CacheHelper.getData(key: CacheKeys.token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'x-localization': lang,
      if (token != null) "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.delete(url, queryParameters: query, data: data);
  }

   Future<Response> putData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'ar',

  }) async {
     token = await CacheHelper.getData(key: CacheKeys.token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
