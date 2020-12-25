import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/collections_with_pagination.dart';
part 'collections_response.g.dart';

@JsonSerializable()
class CollectionsResponse {
  final bool success;

  final CollectionWithPagination data;

  CollectionsResponse({
    this.success,
    this.data,
  });

  factory CollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseToJson(this);
}
