import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/auth.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final bool success;

  final Auth data;

  AuthResponse({
    this.success,
    this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
