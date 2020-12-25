// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionsResponse _$CollectionsResponseFromJson(Map<String, dynamic> json) {
  return CollectionsResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : CollectionWithPagination.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionsResponseToJson(
        CollectionsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
