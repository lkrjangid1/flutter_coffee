
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  String email = '';

  Future<String> getValues() async  {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    email = sharedPrefs.getString('email');
    print("provier  "+email);
    notifyListeners();
    return email;
  }

}