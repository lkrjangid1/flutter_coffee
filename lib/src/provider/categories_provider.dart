import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/categories.dart';

class CategoriesProvider with ChangeNotifier {

  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  List<Categories> listCategories = List();
  bool isLoading = false;
  List<String> listDownloadURL = List();



  Future<List<Categories>> getAllCategories() async {
    isLoading = true;
    print('dang load ');
    await firebaseDatabase.reference().child('Categories').once().then((
        DataSnapshot dataSnapshot) {
       Map<String, dynamic>.from(dataSnapshot.value).forEach((key, value) {
         Categories categories  = Categories(
            image: value['image'],
            name: value['name'],
            des:  value['des'],
          );
          listCategories.add(categories);
       });
    });

    for(var i in listCategories){
      storageReference = FirebaseStorage.instance.ref().child('categories/${i.image}' );
      String downloadUrl  = await storageReference.getDownloadURL();
      listDownloadURL.add(downloadUrl);
    }

    isLoading = false;
    print('load xong');
    notifyListeners();
    return listCategories;

  }

}