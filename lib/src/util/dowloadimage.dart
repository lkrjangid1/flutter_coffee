import 'package:firebase_storage/firebase_storage.dart';

class DowloadImg{
  static StorageReference storageReference;
  static  String downloadUrl = '';
  static Future<String> getImage(String path,String url) async {
    storageReference = FirebaseStorage.instance
        .ref()
        .child('menu/$path/$url');
     downloadUrl = await storageReference.getDownloadURL();

    return downloadUrl;

  }

}