// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ErrorDetailsResponse.serializer))
    .build();
Serializer<ErrorDetailsResponse> _$errorDetailsResponseSerializer =
    new _$ErrorDetailsResponseSerializer();

class _$ErrorDetailsResponseSerializer
    implements StructuredSerializer<ErrorDetailsResponse> {
  @override
  final Iterable<Type> types = const [
    ErrorDetailsResponse,
    _$ErrorDetailsResponse
  ];
  @override
  final String wireName = 'ErrorDetailsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ErrorDetailsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cod;
    if (value != null) {
      result
        ..add('cod')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ErrorDetailsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorDetailsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cod':
          result.cod = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorDetailsResponse extends ErrorDetailsResponse {
  @override
  final int? cod;
  @override
  final String? message;

  factory _$ErrorDetailsResponse(
          [void Function(ErrorDetailsResponseBuilder)? updates]) =>
      (new ErrorDetailsResponseBuilder()..update(updates))._build();

  _$ErrorDetailsResponse._({this.cod, this.message}) : super._();

  @override
  ErrorDetailsResponse rebuild(
          void Function(ErrorDetailsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorDetailsResponseBuilder toBuilder() =>
      new ErrorDetailsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorDetailsResponse &&
        cod == other.cod &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cod.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ErrorDetailsResponse')
          ..add('cod', cod)
          ..add('message', message))
        .toString();
  }
}

class ErrorDetailsResponseBuilder
    implements Builder<ErrorDetailsResponse, ErrorDetailsResponseBuilder> {
  _$ErrorDetailsResponse? _$v;

  int? _cod;
  int? get cod => _$this._cod;
  set cod(int? cod) => _$this._cod = cod;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ErrorDetailsResponseBuilder() {
    ErrorDetailsResponse._initializeBuilder(this);
  }

  ErrorDetailsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cod = $v.cod;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorDetailsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorDetailsResponse;
  }

  @override
  void update(void Function(ErrorDetailsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ErrorDetailsResponse build() => _build();

  _$ErrorDetailsResponse _build() {
    final _$result =
        _$v ?? new _$ErrorDetailsResponse._(cod: cod, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
