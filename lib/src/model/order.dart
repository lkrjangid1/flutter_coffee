import 'package:fluttercoffee/src/model/menu.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';
@JsonSerializable(explicitToJson: true)
class Order {
  Menu menu;
  int amount;

  Order({this.menu, this.amount});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() =>_$OrderToJson(this);
}
//
//class Order{
//   Menu menu;
//   int amount;
//
//
//  Order({this.menu, this.amount});
//
//
//
//}

