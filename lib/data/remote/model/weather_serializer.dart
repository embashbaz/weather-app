
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:weather_app/data/remote/model/weather_response.dart';

part 'weather_serializer.g.dart';

@SerializersFor([
  WeatherResponse
])

final Serializers serializers = (_$serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin()))
    .build();