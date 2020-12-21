import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/phone_data_detail.dart';
part 'phone_detail_response.g.dart';

@JsonSerializable()
class PhoneDetailResponse {
  final bool success;
  final List<PhoneDataDetail> data;
  PhoneDetailResponse({
    this.success,
    this.data,
  });
  factory PhoneDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneDetailResponseToJson(this);
}
