
import 'dart:io';
import 'package:path/path.dart' as path;
class getFileName{

  static Future<String> getFileNameWithExtension(File file)async{

    if(await file.exists()){
      print(path.basename(file.path));
      return path.basename(file.path);

    }else{
      return null;
    }
  }


}
