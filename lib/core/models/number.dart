import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/user.dart';
part 'number.g.dart';

@JsonSerializable()
class Number {
  final int id;
  final String phone;
  final String description;
  final String logo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<User> reportedBy;
  Number(
      {this.id,
      this.phone,
      this.description,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.reportedBy});
  factory Number.fromJson(Map<String, dynamic> json) => _$NumberFromJson(json);
  Map<String, dynamic> toJson() => _$NumberToJson(this);
}
