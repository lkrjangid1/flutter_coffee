class Store {
  String closeTime;
  String opentTime;
  String image;
  double latitude;
  double longitude;
  String name;
  int phone;

  Store(
      {this.closeTime,
        this.opentTime,
        this.image,
        this.latitude,
        this.longitude,
        this.name,
        this.phone});

  Store.fromJson(Map<String, dynamic> json) {
    closeTime = json['CloseTime'];
    opentTime = json['OpentTime'];
    image = json['Image'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    name = json['Name'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CloseTime'] = this.closeTime;
    data['OpentTime'] = this.opentTime;
    data['Image'] = this.image;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    return data;
  }
}