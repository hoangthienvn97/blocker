// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneDetail _$PhoneDetailFromJson(Map<String, dynamic> json) {
  return PhoneDetail(
    id: json['id'] as int,
    phone: json['phone'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    collection: json['collection'] as String,
    numberOfReporters: json['numberOfReporters'] as int,
  );
}

Map<String, dynamic> _$PhoneDetailToJson(PhoneDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'phone': instance.phone,
      'numberOfReporters': instance.numberOfReporters,
      'collection': instance.collection,
    };
