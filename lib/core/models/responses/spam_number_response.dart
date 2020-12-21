import 'package:json_annotation/json_annotation.dart';
part 'spam_number_response.g.dart';

@JsonSerializable()
class SpamNumberResponse {
  final bool success;

  final bool data;

  SpamNumberResponse({
    this.success,
    this.data,
  });

  factory SpamNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$SpamNumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpamNumberResponseToJson(this);
}
