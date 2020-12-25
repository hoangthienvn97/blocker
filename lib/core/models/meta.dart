import 'package:json_annotation/json_annotation.dart';
part 'meta.g.dart';

@JsonSerializable()
class Meta {
  final int totalItems;

  final int itemCount;

  final int itemsPerPage;

  final int totalPages;

  final int currentPage;

  Meta(
      {this.totalItems,
      this.currentPage,
      this.itemCount,
      this.itemsPerPage,
      this.totalPages});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
