class Bill {
  String codeBill;
  String dateTime;
  String totalBill;

  Bill({this.codeBill, this.dateTime, this.totalBill});

  Bill.fromJson(Map<String, dynamic> json) {
    codeBill = json['codeBill'];
    dateTime = json['dateTime'];
    totalBill = json['totalBill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codeBill'] = this.codeBill;
    data['dateTime'] = this.dateTime;
    data['totalBill'] = this.totalBill;
    return data;
  }
}