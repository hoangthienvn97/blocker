// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneDetailResponse _$PhoneDetailResponseFromJson(Map<String, dynamic> json) {
  return PhoneDetailResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneDataDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PhoneDetailResponseToJson(
        PhoneDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
