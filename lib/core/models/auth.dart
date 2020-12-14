import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/user.dart';
part 'auth.g.dart';

@JsonSerializable()
class Auth {
  final User user;

  final String tokenType;

  final String accessToken;

  final int expiresIn;

  Auth({this.user, this.tokenType, this.accessToken, this.expiresIn});

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
