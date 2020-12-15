// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberResponse _$NumberResponseFromJson(Map<String, dynamic> json) {
  return NumberResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : Number.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NumberResponseToJson(NumberResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
