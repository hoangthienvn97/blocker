import 'package:json_annotation/json_annotation.dart';
import 'package:phone_blocker/core/models/meta.dart';
import 'collection.dart';
part 'collections_with_pagination.g.dart';

@JsonSerializable()
class CollectionWithPagination {

  List<Collection> items;
  
  final Meta meta;
  CollectionWithPagination(
      {this.items,
      this.meta
      });
  factory CollectionWithPagination.fromJson(Map<String, dynamic> json) =>
      _$CollectionWithPaginationFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionWithPaginationToJson(this);
}
