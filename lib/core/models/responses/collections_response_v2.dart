import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/collection.dart';
part 'collections_response_v2.g.dart';

@JsonSerializable()
class CollectionsResponseV2 {
  final bool success;

  List<Collection> data;

  CollectionsResponseV2({
    this.success,
    this.data,
  });

  factory CollectionsResponseV2.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseV2FromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseV2ToJson(this);
}
