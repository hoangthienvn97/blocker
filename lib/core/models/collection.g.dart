// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection(
    id: json['id'] as int,
    description: json['description'] as String,
    logo: json['logo'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    listNumbers: (json['listNumbers'] as List)
        ?.map((e) =>
            e == null ? null : Number.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    favorited: json['favorited'] as bool,
    favoritedCount: json['favoritedCount'] as int,
    collected: json['collected'] as bool,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'logo': instance.logo,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'listNumbers': instance.listNumbers,
      'favorited': instance.favorited,
      'favoritedCount': instance.favoritedCount,
      'collected': instance.collected,
    };
