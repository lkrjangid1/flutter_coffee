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
  Menu menu;
  List<String> listImageSlide = List();
  List<String> listImageSlideURL = List();
  String downloadUrl;

  Future<List<Menu>> getAllMenu() async {
    isLoading = true;
    var dataMenu =
        await firebaseDatabase.reference().child('Menu').child('Cafe').once();
    listMenu.clear();
    listImageURL.clear();

    Map<String, dynamic>.from(dataMenu.value).forEach((key, value) {
      menu = Menu(
        image: value['image'],
        name: value['name'],
        des: value['des'],
        price: value['price'],
      );
      listMenu.add(menu);
    });
    listImageURL.clear();

    for (var i in listMenu) {
      storageReference = FirebaseStorage.instance
          .ref()
          .child('menu/')
          .child('Cafe/${i.image}');
      String downloadUrl = await storageReference.getDownloadURL();
      listImageURL.add(downloadUrl);

    }
    isLoading = false;
    notifyListeners();
    return listMenu;
  }


  Future<List<String>> getImageSlide() async {
//    listImageSlide.clear();
//    var data =  await firebaseDatabase.reference().child('ImageSlide').once();
//
//    print(data.value);
//     Map<String,dynamic>.from(data.value).forEach((key, value) {
//      listImageSlide.add(value);
//
//    });
//


//    storageReference = FirebaseStorage.instance
//        .ref()
//        .child('news/')
//        .child('intro/');
//    String downloadUrl = await storageReference.getDownloadURL();
//    print(downloadUrl);

//
//    for(String  i in listImageSlide){
//
//      storageReference = FirebaseStorage.instance
//          .ref()
//          .child('news/')
//          .child('intro/${i}');
//      String downloadUrl = await storageReference.getDownloadURL();
//      print(downloadUrl);
//
//      listImageSlideURL.add(downloadUrl);
//

    return listImageSlide;
  }
}
