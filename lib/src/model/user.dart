
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User {
  String key;
  String image;
  String userName;
  String phoneNumber;
  String email;

  User({this.key, this.image, this.userName, this.phoneNumber, this.email});

factory  User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);

  Map<dynamic, dynamic> toJson() => _$UserToJson(this);
}