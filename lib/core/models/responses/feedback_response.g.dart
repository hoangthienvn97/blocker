// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResponse _$FeedbackResponseFromJson(Map<String, dynamic> json) {
  return FeedbackResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : Feedback.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeedbackResponseToJson(FeedbackResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
