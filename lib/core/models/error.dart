import 'package:json_annotation/json_annotation.dart';
part 'error.g.dart';
@JsonSerializable()
class ErrorModel {
  final int statusCode;
  final String path;
  final String method;
  final String message;
  final DateTime timestamp;
  ErrorModel(
      {this.statusCode,
      this.path,
      this.method,
      this.message,
      this.timestamp,
      });
  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}