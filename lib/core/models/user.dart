import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String avatar;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.avatar,
      this.email,
      this.createdAt,
      this.updatedAt});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}