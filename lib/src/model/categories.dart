class Categories {
  String name;
  String image;
  String des;

  Categories({this.name, this.image, this.des});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    des = json['des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['des'] = this.des;
    return data;
  }
}