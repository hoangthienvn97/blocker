// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberCountResponse _$PhoneNumberCountResponseFromJson(
    Map<String, dynamic> json) {
  return PhoneNumberCountResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Collection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PhoneNumberCountResponseToJson(
        PhoneNumberCountResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
