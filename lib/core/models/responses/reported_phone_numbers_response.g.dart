// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_phone_numbers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportedPhoneNumbersResponse _$ReportedPhoneNumbersResponseFromJson(
    Map<String, dynamic> json) {
  return ReportedPhoneNumbersResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ReportedPhoneNumber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReportedPhoneNumbersResponseToJson(
        ReportedPhoneNumbersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
