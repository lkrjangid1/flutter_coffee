
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/menu.dart';

class HomeProvider with ChangeNotifier {
  List<Menu> listMenu = List();
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  List<String> listImageURL = List();
  bool isLoading = false;

  Future<List<Menu>> getAllMenu() async {
    isLoading = true;
    var dataMenu = await firebaseDatabase.reference().child('Menu').child('Cafe').once();
    listMenu.clear();
    listImageURL.clear();


    Map<String,dynamic>.from(dataMenu.value).forEach((key, value) {
      Menu menu = Menu(
        image: value['image'],
        name: value['name'],
        des: value['des'],
        price: value['price'],
      );
      listMenu.add(menu);
      print(listMenu.length);
    });
    print(listMenu.length);
    listImageURL.clear();
    for(var i in listMenu){
      storageReference = FirebaseStorage.instance.ref().child('menu/' ).child('drink/${i.image}');
      String downloadUrl  = await storageReference.getDownloadURL();
      listImageURL.add(downloadUrl);
    }
    isLoading =false;
    notifyListeners();
    return listMenu;
  }

}