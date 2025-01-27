import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weather_app/data/local/model/weather_data_entity.dart';
import 'package:weather_app/data/remote/api/utils.dart';
import 'package:weather_app/data/remote/model/weather_response.dart';
import 'package:weather_app/data/repo/utils.dart';
import 'package:weather_app/domain/logic/list_utils.dart';

import '../local/db_helper/db_helper.dart';
import '../remote/api/api_service.dart';
import 'main_repository.dart';

class MainRepositoryImplementation extends MainRepository {
  final DioHttpService _dioApiService;
  final DatabaseService _dbService;

  MainRepositoryImplementation(this._dioApiService, this._dbService);

  WeatherDataResponse? getApiData({int? cityId, String? cityName}) async {
    var apiData = await _dioApiService.getAllWeatherData(
        cityId: cityId, cityName: cityName);

    WeatherAppError? error;
    WeatherResponse? response;

    apiData.fold((l) {
      error = l;
    }, (r) {
      response = WeatherResponse.fromJson(r.data);
    });
    if (response != null) {
      return Right(response!);
    } else if (error != null) {
      return Left(error!);
    }
  }

  WeatherDataResponse? getDbWeatherData({int? cityId}) async {
    List<WeatherEntity>? dbData;
    if (cityId != null) {
      try {
        dbData = await _dbService.getWeatherData(cityId);
      } catch (e) {}
    }
    if (dbData.isNullOrEmpty) {
      try {
        dbData = await _dbService.getLastUpdatedWeatherData();
      } catch (e) {}
    }
    if (!dbData.isNullOrEmpty) {
      var weatherJson = dbData!.first.weatherObject;
      if (weatherJson != null && weatherJson.isNotEmpty) {
        var data = WeatherResponse.fromJson(json.decode(weatherJson));
        return (Right(data));
      }
    }
  }

  @override
  Future<void> getData(Function onResult,
      {int? cityId, String? cityName}) async {
    var dbRecord = await getDbWeatherData(cityId: cityId);
    onResult(dbRecord);
    var apiRecord = await getApiData(cityId: cityId, cityName: cityName);
    onResult(apiRecord);
    apiRecord?.fold((l) => null, (r) {
      var dbRecord = WeatherEntity(
          cityId: r.city?.id ?? 0,
          cityName: r.city?.name,
          weatherObject: jsonEncode(r.toJson()),
          timeAdded: DateTime.now().millisecondsSinceEpoch);
      _dbService.addUpdateWeatherDataEntity(dbRecord);
    });
  }
}
