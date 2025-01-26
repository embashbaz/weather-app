import 'package:json_annotation/json_annotation.dart';

part 'weather_data_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  int? cityId;

  String? cityName;

  String? weatherObject;

  int? timeAdded;

  WeatherEntity(
      {
        this.cityId,
        this.cityName,
        this.weatherObject,
        this.timeAdded});

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}