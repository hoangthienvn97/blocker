// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Number _$NumberFromJson(Map<String, dynamic> json) {
  return Number(
    id: json['id'] as int,
    phone: json['phone'] as String,
    description: json['description'] as String,
    logo: json['logo'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    reportedBy: (json['reportedBy'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NumberToJson(Number instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'description': instance.description,
      'logo': instance.logo,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'reportedBy': instance.reportedBy,
    };
