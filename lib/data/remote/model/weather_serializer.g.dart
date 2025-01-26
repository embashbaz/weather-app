// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_serializer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(City.serializer)
      ..add(Clouds.serializer)
      ..add(Coord.serializer)
      ..add(Main.serializer)
      ..add(Sys.serializer)
      ..add(Weather.serializer)
      ..add(WeatherList.serializer)
      ..add(WeatherResponse.serializer)
      ..add(Wind.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Weather)]),
          () => new ListBuilder<Weather>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(WeatherList)]),
          () => new ListBuilder<WeatherList>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
