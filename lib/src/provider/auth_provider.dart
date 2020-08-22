
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttercoffee/src/model/user.dart';
import 'package:fluttercoffee/src/service/base_auth.dart';
import 'package:fluttercoffee/src/util/getfilename.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';


class AuthProvider with ChangeNotifier implements BaseAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference databaseReference;
  String authError = '';
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  String uid = '';
  bool isLoading = false;
  final _facebooklogin = FacebookLogin();
  final dio = Dio();

  @override
  Future logOutUser() async {
    // TODO: implement logOutUser
    try{
      await  firebaseAuth.signOut();
    }catch(e){
      print(e);
    }
  }

  @override
  Future loginUser(String email, String password) async {
    isLoading = true;
    try{
      AuthResult authResult =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      uid = authResult.user.uid;
      return authResult.user != null;
    }catch (error){
        authError = error.code;
        PlatformException(code: authError);
    }
    isLoading = false;
    notifyListeners();

  }

  @override
  Future registerUser(String email, String password, String phoneNumber, String userName, File urlImage) async {
    isLoading = true;
    AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    String uid = authResult.user.uid;
    databaseReference = firebaseDatabase.reference().child('User').child(uid);

    String fileName =  await  getFileName.getFileNameWithExtension(urlImage);

    storageReference = FirebaseStorage.instance.ref().child('user').child(fileName);
    StorageUploadTask storageUploadTask = storageReference.putFile(urlImage);
    StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;
    String dowloadURL = await snapshot.ref.getDownloadURL();

    User user = User(key: uid,userName: userName,phoneNumber: phoneNumber,image: dowloadURL,email: authResult.user.email);
    databaseReference.set(user.toJson());

    isLoading = false;
    notifyListeners();

  }

  void isLoadingg(bool status){
    isLoading = status;
    notifyListeners();
  }

  @override
  Future loginFB() async {
    _facebooklogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final result = await _facebooklogin.logIn(['email']);
    final token = result.accessToken.token;
    

    final graqh = await  dio.get('https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${token}');
    final profile = graqh.data;

//    Map<String,dynamic> abc  = graqh.data;
//    print(abc.keys);
//    print(graqh.data);

    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.getCredential(accessToken:token);
     await   firebaseAuth.signInWithCredential(credential);
    }
  }

}