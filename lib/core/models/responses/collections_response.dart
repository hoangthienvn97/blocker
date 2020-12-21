import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/collection.dart';
part 'collections_response.g.dart';

@JsonSerializable()
class CollectionsResponse {
  final bool success;

  List<Collection> data;

  CollectionsResponse({
    this.success,
    this.data,
  });

  factory CollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseToJson(this);
}
