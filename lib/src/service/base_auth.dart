
import 'dart:io';

abstract class BaseAuth{
  Future registerUser(String email,String password,int phoneNumber,String userName,File urlImage);

  Future logOutUser();

  Future loginUser(String email,String password);

}