class Store {
  String image;
  double latitute;
  double longitude;
  String name;
  int phone;

  Store({this.image, this.latitute, this.longitude, this.name, this.phone});

  Store.fromJson(Map<String, dynamic> json) {
    image = json['Image'];
    latitute = json['Latitute'];
    longitude = json['Longitude'];
    name = json['Name'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Image'] = this.image;
    data['Latitute'] = this.latitute;
    data['Longitude'] = this.longitude;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    return data;
  }
}

