import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/phone_detail.dart';
part 'phone_data_detail.g.dart';

@JsonSerializable()
class PhoneDataDetail {
  final int id;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PhoneDetail phone;
  PhoneDataDetail({
    this.id,
    this.phone,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
  factory PhoneDataDetail.fromJson(Map<String, dynamic> json) =>
      _$PhoneDataDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneDataDetailToJson(this);
}
