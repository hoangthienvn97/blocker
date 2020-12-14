// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionResponse _$CollectionResponseFromJson(Map<String, dynamic> json) {
  return CollectionResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : Collection.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionResponseToJson(CollectionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
