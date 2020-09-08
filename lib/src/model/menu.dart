import 'package:json_annotation/json_annotation.dart';
part 'menu.g.dart';
@JsonSerializable()
class Menu {
  String name;
  String image;
  String price;
  String des;
  String menuId;

  Menu({this.name, this.image, this.price, this.des, this.menuId});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}