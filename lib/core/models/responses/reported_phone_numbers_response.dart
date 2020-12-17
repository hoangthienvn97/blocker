import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/reported_phone_number.dart';
part 'reported_phone_numbers_response.g.dart';

@JsonSerializable()
class ReportedPhoneNumbersResponse {
  final bool success;

  final List<ReportedPhoneNumber> data;

  ReportedPhoneNumbersResponse({
    this.success,
    this.data,
  });

  factory ReportedPhoneNumbersResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportedPhoneNumbersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportedPhoneNumbersResponseToJson(this);
}
