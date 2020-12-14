import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/collection.dart';
part 'collection_response.g.dart';

@JsonSerializable()
class CollectionResponse {
  final bool success;

  final Collection data;

  CollectionResponse({
    this.success,
    this.data,
  });

  factory CollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionResponseToJson(this);
}
