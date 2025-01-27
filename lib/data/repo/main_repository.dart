


import 'package:weather_app/data/repo/utils.dart';

abstract class MainRepository {

  // WeatherDataResponse getDbWeatherData();
  //
  // WeatherDataResponse getApiData({int? cityId, int? cityName});

  Future<void> getData(Function onResult, {int? cityId, String? cityName});


}