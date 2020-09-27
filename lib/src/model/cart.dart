import 'package:fluttercoffee/src/model/menu.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart.g.dart';
@JsonSerializable(explicitToJson: true)
class Cart {
  Menu menu;
  int  quantity;
  Cart({this.menu, this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);

  void increment() {
    quantity ++;

  }
  void decrement(){
    quantity == 1 ? quantity : quantity--;
  }

}