

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'error_model.g.dart';


abstract class ErrorDetailsResponse implements Built<ErrorDetailsResponse, ErrorDetailsResponseBuilder> {

  int? get cod;

  String? get message;


  ErrorDetailsResponse._();

  factory ErrorDetailsResponse([void Function(ErrorDetailsResponseBuilder) updates]) = _$ErrorDetailsResponse;

  static Serializer<ErrorDetailsResponse> get serializer => _$errorDetailsResponseSerializer;

  static void _initializeBuilder(ErrorDetailsResponseBuilder builder) =>
      builder
        ..cod = null
        ..message = null;

  factory ErrorDetailsResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}

@SerializersFor([ErrorDetailsResponse])
final Serializers serializers = (_$serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin()))
    .build();