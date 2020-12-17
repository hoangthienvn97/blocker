// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportedPhoneNumber _$ReportedPhoneNumberFromJson(Map<String, dynamic> json) {
  return ReportedPhoneNumber(
    id: json['id'] as int,
    phone: json['phone'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$ReportedPhoneNumberToJson(
        ReportedPhoneNumber instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
