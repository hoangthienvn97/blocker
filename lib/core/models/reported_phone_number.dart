import 'package:json_annotation/json_annotation.dart';
part 'reported_phone_number.g.dart';

@JsonSerializable()
class ReportedPhoneNumber {
  final int id;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  ReportedPhoneNumber({
    this.id,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });
  factory ReportedPhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$ReportedPhoneNumberFromJson(json);
  Map<String, dynamic> toJson() => _$ReportedPhoneNumberToJson(this);
}
