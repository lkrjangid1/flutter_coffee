import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/util/router_path.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/emptycart.png',fit: BoxFit.cover,),
              Text("Giỏ rỗng",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 10,
              ),
              Text("Nhìn kìa bạn chưa thêm đồ uống vào giỏ hàng!"),
              RaisedButton(
                onPressed: (){
//                    Navigator.pushNamedAndRemoveUntil(context, DashBoardPage, (route) => false);
                  },
                child: Text("Thêm đồ uống ngay"),
              )
            ],
        ),
      ),
    );
  }
}
