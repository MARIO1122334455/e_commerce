import 'package:dio/dio.dart';
import 'package:e_commerce/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';


@singleton 
class Apimanger {
  late Dio dio;

  Apimanger() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint, {Map<String, dynamic>? queryPram}) {
    return dio.get(AppConstants.baseUrl + endPoint, queryParameters: queryPram);
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryPram, Map<String, dynamic>? body}) {
    return dio.post('https://ecommerce.routemisr.com/api/v1/auth/signin',
        queryParameters: queryPram, data: body , options:Options(
          validateStatus: ((status) => true)
        ) );
  }
}
