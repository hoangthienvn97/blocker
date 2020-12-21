import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/collection.dart';
part 'phone_number_count_response.g.dart';

@JsonSerializable()
class PhoneNumberCountResponse {
  final bool success;

  final List<Collection> data;

  PhoneNumberCountResponse({
    this.success,
    this.data,
  });

  factory PhoneNumberCountResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberCountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberCountResponseToJson(this);
}
