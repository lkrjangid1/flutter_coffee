
import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';
@JsonSerializable()
class News {
  String title;
  String des;
  String image;

  News({this.title, this.des, this.image});

factory  News.fromJson(Map<String, dynamic> json) =>_$NewsFromJson(json);
  Map<String, dynamic> toJson() =>_$NewsToJson(this);
}