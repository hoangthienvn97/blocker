// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_with_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionWithPagination _$CollectionWithPaginationFromJson(
    Map<String, dynamic> json) {
  return CollectionWithPagination(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Collection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionWithPaginationToJson(
        CollectionWithPagination instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };
