

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/remote/api/utils.dart';
import 'package:weather_app/data/remote/api/weather_res.dart';

class DioHttpService {

  late Dio _dio;


  DioHttpService() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        //contentType: 'application/json',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60)));

    initializeInterceptor(_dio);
  }

  initializeInterceptor(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, responseInterceptorHandler) {
          debugPrint('${response.statusCode}  \n${response.data}');
          return responseInterceptorHandler.next(response);
        },

        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {

          debugPrint(
              '${options.method}  \n${options.path} \n${options
                  .headers} \n${options.queryParameters} \n${options.data}');
          return handler.next(options);
        },
      ),
    );
  }


  NetworkResponse getAllProducts({int? cityId, int? cityName}) {
    return apiCall(() async {
      return _dio.get("", queryParameters: {
        if(cityId != null) "id": cityId,
        if(cityName != null) "q": cityName,
        "appid": API_KEY
      });
    });
  }

}


