import 'package:json_annotation/json_annotation.dart';
part 'phone_detail.g.dart';

@JsonSerializable()
class PhoneDetail {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String phone;
  final int numberOfReporters;
  final String collection;
  PhoneDetail(
      {this.id,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.collection,
      this.numberOfReporters});
  factory PhoneDetail.fromJson(Map<String, dynamic> json) =>
      _$PhoneDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneDetailToJson(this);
}
