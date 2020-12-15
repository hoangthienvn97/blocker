import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/number.dart';
part 'number_response.g.dart';

@JsonSerializable()
class NumberResponse {
  final bool success;

  final Number data;

  NumberResponse({
    this.success,
    this.data,
  });

  factory NumberResponse.fromJson(Map<String, dynamic> json) =>
      _$NumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NumberResponseToJson(this);
}
