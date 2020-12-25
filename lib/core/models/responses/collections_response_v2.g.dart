// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_response_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionsResponseV2 _$CollectionsResponseV2FromJson(
    Map<String, dynamic> json) {
  return CollectionsResponseV2(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Collection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CollectionsResponseV2ToJson(
        CollectionsResponseV2 instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
