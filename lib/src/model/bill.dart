import 'package:fluttercoffee/src/model/billdetail.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:json_annotation/json_annotation.dart';
//part 'bill.g.dart';
@JsonSerializable()
class Bill {
  String codeBill;
  String dateTime;
  String totalBill;
  List<Cart>listCart = [];

  Bill({this.codeBill, this.dateTime, this.totalBill,this.listCart});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codeBill'] = this.codeBill;
    data['dateTime'] = this.dateTime;
    data['totalBill'] = this.totalBill;
    data['listCart'] = this.listCart;
    return data;
  }
}

