import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/history/detail_history_page.dart';
import 'package:fluttercoffee/src/provider/bill_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> BillProvider(),
      child: HistoryPagee(),
    );
  }
}


class HistoryPagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Provider.of<BillProvider>(context, listen: false).getAllBill();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kColorGreen,
        title: Text("History Order "),
      ),
      body: Container(
        padding:  EdgeInsets.symmetric(horizontal: getScreenWith(10),vertical: getScreenHeight(10)),
        child: Consumer<BillProvider>(
          builder: (BuildContext context,  BillProvider billProvider, Widget child){
            return billProvider.isLoading ? Center(child: CircularProgressIndicator()) :
            ListView.builder(
              itemCount: billProvider.listBill.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Bill bill = billProvider.listBill[index];
                int timeStamp = int.parse(bill.dateTime);
                var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
                return billProvider.listBill.length == 0 ? Text("a") : Padding(
                  padding:  EdgeInsets.only(bottom: getScreenHeight(15)),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailHistoryPage(bill: billProvider.listBill[index],)));
                    },
                    child: ContainerCard(
                      child: OrderHistoryItem(
                        codeBill: bill.codeBill,
                        dateTime: date.toString().substring(0,19),
                        totalBill: bill.totalBill,
                      )
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  final String codeBill;
  final String dateTime;
  final String totalBill;

  const OrderHistoryItem(
      {Key key, this.codeBill, this.dateTime, this.totalBill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.label_outline),
         SizedBox(
          width: getScreenWith(10),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                codeBill.substring(1, 10),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Completed",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(dateTime)
            ],
          ),
        ),
        Text(
          "\$$totalBill",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
