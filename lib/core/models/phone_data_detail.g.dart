// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_data_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneDataDetail _$PhoneDataDetailFromJson(Map<String, dynamic> json) {
  return PhoneDataDetail(
    id: json['id'] as int,
    phone: json['phone'] == null
        ? null
        : PhoneDetail.fromJson(json['phone'] as Map<String, dynamic>),
    description: json['description'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$PhoneDataDetailToJson(PhoneDataDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'phone': instance.phone,
    };
