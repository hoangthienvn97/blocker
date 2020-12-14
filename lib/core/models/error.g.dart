// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return ErrorModel(
    statusCode: json['statusCode'] as int,
    path: json['path'] as String,
    method: json['method'] as String,
    message: json['message'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'path': instance.path,
      'method': instance.method,
      'message': instance.message,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
