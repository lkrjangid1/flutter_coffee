
import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class BaseAuth{
  Future registerUser(String email,String password,String phoneNumber,String userName,File urlImage);

  Future logOutUser();

  Future loginUser(String email,String password);

  Future loginFB();


}