// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spam_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpamNumberResponse _$SpamNumberResponseFromJson(Map<String, dynamic> json) {
  return SpamNumberResponse(
    success: json['success'] as bool,
    data: json['data'] as bool,
  );
}

Map<String, dynamic> _$SpamNumberResponseToJson(SpamNumberResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
