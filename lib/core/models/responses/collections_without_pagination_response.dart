import 'package:json_annotation/json_annotation.dart';

import '../model_common.dart';
part 'collections_without_pagination_response.g.dart';

@JsonSerializable()
class CollectionsWithoutPaginationResponse {
  final bool success;

  final List<Collection> data;

  CollectionsWithoutPaginationResponse({
    this.success,
    this.data,
  });

  factory CollectionsWithoutPaginationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CollectionsWithoutPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CollectionsWithoutPaginationResponseToJson(this);
}
