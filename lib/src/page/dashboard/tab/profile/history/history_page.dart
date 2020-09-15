import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/history/detail_history_page.dart';
import 'package:fluttercoffee/src/provider/bill_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
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

        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Consumer<BillProvider>(
          builder: (BuildContext context,  BillProvider billProvider, Widget child){
            return billProvider.isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
              itemCount: billProvider.listBill.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Bill bill = billProvider.listBill[index];
                int timeStamp = int.parse(bill.dateTime);
                var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailHistoryPage(bill: billProvider.listBill[index],)));
                    },
                    child: ContainerCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.label_outline),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  bill.codeBill.substring(1,10),
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text("Completed",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold
                                  ),),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(date.toString().substring(0,19))
                              ],
                            ),
                          ),

                          Text("\$${bill.totalBill}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
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
