import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:weather_app/data/remote/model/weather_serializer.dart';

part 'weather_response.g.dart';

abstract class WeatherResponse
    implements Built<WeatherResponse, WeatherResponseBuilder> {
  String get cod;
  int get message;
  int get cnt;
  BuiltList<WeatherList> get list;
  City get city;

  WeatherResponse._();

  factory WeatherResponse([void Function(WeatherResponseBuilder) updates]) =
  _$WeatherResponse;

  static Serializer<WeatherResponse> get serializer =>
      _$weatherResponseSerializer;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}

abstract class WeatherList implements Built<WeatherList, WeatherListBuilder> {
  int get dt;
  Main get main;
  BuiltList<Weather> get weather;
  Clouds get clouds;
  Wind get wind;
  int get visibility;
  double get pop;
  Sys get sys;
  String get dt_txt;

  WeatherList._();

  factory WeatherList([void Function(WeatherListBuilder) updates]) = _$WeatherList;

  static Serializer<WeatherList> get serializer => _$weatherListSerializer;
}

abstract class Main implements Built<Main, MainBuilder> {
  double get temp;
  double get feels_like;
  double get temp_min;
  double get temp_max;
  int get pressure;
  int get sea_level;
  int get grnd_level;
  int get humidity;
  double get temp_kf;

  Main._();

  factory Main([void Function(MainBuilder) updates]) = _$Main;

  static Serializer<Main> get serializer => _$mainSerializer;
}

abstract class Weather implements Built<Weather, WeatherBuilder> {
  int get id;
  String get main;
  String get description;
  String get icon;

  Weather._();

  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  static Serializer<Weather> get serializer => _$weatherSerializer;
}

abstract class Clouds implements Built<Clouds, CloudsBuilder> {
  int get all;

  Clouds._();

  factory Clouds([void Function(CloudsBuilder) updates]) = _$Clouds;

  static Serializer<Clouds> get serializer => _$cloudsSerializer;
}

abstract class Wind implements Built<Wind, WindBuilder> {
  double get speed;
  int get deg;
  double get gust;

  Wind._();

  factory Wind([void Function(WindBuilder) updates]) = _$Wind;

  static Serializer<Wind> get serializer => _$windSerializer;
}

abstract class Sys implements Built<Sys, SysBuilder> {
  String get pod;

  Sys._();

  factory Sys([void Function(SysBuilder) updates]) = _$Sys;

  static Serializer<Sys> get serializer => _$sysSerializer;
}

abstract class City implements Built<City, CityBuilder> {
  int get id;
  String get name;
  Coord get coord;
  String get country;
  int get population;
  int get timezone;
  int get sunrise;
  int get sunset;

  City._();

  factory City([void Function(CityBuilder) updates]) = _$City;

  static Serializer<City> get serializer => _$citySerializer;
}

abstract class Coord implements Built<Coord, CoordBuilder> {
  double get lat;
  double get lon;

  Coord._();

  factory Coord([void Function(CoordBuilder) updates]) = _$Coord;

  static Serializer<Coord> get serializer => _$coordSerializer;
}
