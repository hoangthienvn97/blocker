import 'package:json_annotation/json_annotation.dart';
part 'feedback.g.dart';

@JsonSerializable()
class Feedback {
  final String email;
  final String content;
  final bool deletedAt;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  Feedback(
      {this.email, this.id, this.updatedAt, this.content, this.createdAt, this.deletedAt});
  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
