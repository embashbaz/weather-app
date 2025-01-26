// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) =>
    WeatherEntity(
      cityId: (json['cityId'] as num?)?.toInt(),
      cityName: json['cityName'] as String?,
      weatherObject: json['weatherObject'] as String?,
      timeAdded: (json['timeAdded'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeatherEntityToJson(WeatherEntity instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'weatherObject': instance.weatherObject,
      'timeAdded': instance.timeAdded,
    };
