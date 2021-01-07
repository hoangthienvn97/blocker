import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/feedback.dart';
part 'feedback_response.g.dart';

@JsonSerializable()
class FeedbackResponse {
  final bool success;

  final Feedback data;

  FeedbackResponse({
    this.success,
    this.data,
  });

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackResponseToJson(this);
}
