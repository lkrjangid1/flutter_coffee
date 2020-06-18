import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Widget child;

  const ContainerCard({Key key, this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: Colors.grey.withOpacity(.3),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: Color(0xffb8bfce).withOpacity(.1),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child
    );
  }
}
