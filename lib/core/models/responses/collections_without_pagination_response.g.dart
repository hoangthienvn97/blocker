// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_without_pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionsWithoutPaginationResponse
    _$CollectionsWithoutPaginationResponseFromJson(Map<String, dynamic> json) {
  return CollectionsWithoutPaginationResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Collection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CollectionsWithoutPaginationResponseToJson(
        CollectionsWithoutPaginationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
