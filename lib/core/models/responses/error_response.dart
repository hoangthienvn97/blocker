import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/error.dart';
part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final bool success;

  final ErrorModel data;

  ErrorResponse({
    this.success,
    this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
