
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class StoreProvider with ChangeNotifier{
   Permission permission;
   PermissionStatus permissionStatus = PermissionStatus.undetermined;

  Future checkPermissionLocation () async{
 var status =     await Permission.locationWhenInUse.status;
 permissionStatus = status;
 notifyListeners();
//    await Permission.locationWhenInUse.request();
//    await openAppSettings();
  }

}