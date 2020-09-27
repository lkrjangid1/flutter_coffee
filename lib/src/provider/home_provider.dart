import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/news.dart';

class HomeProvider with ChangeNotifier {
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  List<String> listImageURL = List();
  bool isLoading = false;
  List<String> listImageSlide = List();
  List<News> listNews1 = List();
  List<News> listNews2 = List();
  List<News> listNews3 = List();
  List<String>listImageNewsURL = List();
  List<String>listImageNewsURL2 = List();
  List<String>listImageNewsURL3 = List();
  List<String> listImageSlideURL = List();
  

  Future<List<String>> getImageSlide() async {
    isLoading = true;
    listImageSlide.clear();
    var data =  await firebaseDatabase.reference().child('ImageSlide').once();
     Map<String,dynamic>.from(data.value).forEach((key, value) {
      listImageSlide.add(value);
    });
     listImageSlideURL.clear();
     for(var i in listImageSlide){
       storageReference = FirebaseStorage.instance
           .ref()
           .child('news/')
           .child('intro/$i');
       String downloadUrl = await storageReference.getDownloadURL();
       listImageSlideURL.add(downloadUrl);
     }
     isLoading = false;
    notifyListeners();
    return listImageSlideURL;
  }

  Future<List<News>> getNews1() async {
    isLoading = true;
    listNews1.clear();
    var data =  await firebaseDatabase.reference().child('News').child('1').once();
    Map<dynamic,dynamic>.from(data.value).forEach((key, value) {

        News news = News(
          title: value['title'],
          des: value['des'],
          image: value['image'],
        );
        listNews1.add(news);
    });

    listImageNewsURL.clear();
    for(var i in listNews1){
      storageReference = FirebaseStorage.instance
          .ref()
          .child('news/')
          .child('1/${i.image}');
      String downloadUrl = await storageReference.getDownloadURL();
      listImageNewsURL.add(downloadUrl);
    }
    isLoading = false;
    notifyListeners();
    return listNews1;
  }

  Future<List<News>> getNews2() async {
    isLoading =  true;
    listNews2.clear();
    var data =  await firebaseDatabase.reference().child('News').child('2').once();
    Map<dynamic,dynamic>.from(data.value).forEach((key, value) {

      News news = News(
        title: value['title'],
        des: value['des'],
        image: value['image'],
      );
      listNews2.add(news);
    });

    listImageNewsURL2.clear();

    for(var i in listNews2){
      storageReference = FirebaseStorage.instance
          .ref()
          .child('news/')
          .child('2/${i.image}');
      String downloadUrl = await storageReference.getDownloadURL();
      listImageNewsURL2.add(downloadUrl);
    }
    isLoading = false;
    notifyListeners();
    return listNews2;
  }


  Future<List<News>> getNews3() async {
    isLoading =  true;
    listNews3.clear();
    var data =  await firebaseDatabase.reference().child('News').child('3').once();
    Map<dynamic,dynamic>.from(data.value).forEach((key, value) {

      News news = News(
        title: value['title'],
        des: value['des'],
        image: value['image'],
      );
      listNews3.add(news);
    });

    listImageNewsURL3.clear();

    for(var i in listNews3){
      storageReference = FirebaseStorage.instance
          .ref()
          .child('news/')
          .child('3/${i.image}');
      String downloadUrl = await storageReference.getDownloadURL();
      listImageNewsURL3.add(downloadUrl);
    }
    isLoading = false;
    notifyListeners();
    return listNews3;
  }


}
