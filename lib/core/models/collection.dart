import 'package:json_annotation/json_annotation.dart';
import 'number.dart';
part 'collection.g.dart';
@JsonSerializable()
class Collection {
  final int id;
  final String description;
  final String logo;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Number> listNumbers;
  final bool favorited;
  final int favoritedCount;
  final bool collected;
  Collection(
      {this.id,
      this.description,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.listNumbers,
      this.favorited,
      this.favoritedCount,
      this.collected,
      this.name});
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}