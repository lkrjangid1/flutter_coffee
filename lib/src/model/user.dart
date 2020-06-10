class User {
  String key;
  String image;
  String userName;
  int phoneNumber;
  String password;
  String email;

  User(
      {this.key,
        this.image,
        this.userName,
        this.phoneNumber,
        this.password,
        this.email});

  User.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    image = json['image'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['image'] = this.image;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}