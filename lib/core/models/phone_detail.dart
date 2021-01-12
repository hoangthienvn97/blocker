import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/collection.dart';
part 'phone_detail.g.dart';

@JsonSerializable()
class PhoneDetail {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String phone;
  final int numberOfReporters;
  final Collection collection;
  final bool reported;
  PhoneDetail(
      {this.id,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.collection,
      this.numberOfReporters,
      this.reported});
  factory PhoneDetail.fromJson(Map<String, dynamic> json) =>
      _$PhoneDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneDetailToJson(this);
}
