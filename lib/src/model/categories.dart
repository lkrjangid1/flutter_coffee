import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';
@JsonSerializable()
class Categories {
  String name;
  String image;
  String des;
  Categories({this.name, this.image, this.des});

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}