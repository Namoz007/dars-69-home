
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestStoragePermission() async {
     var permission = await Permission.storage.request();
    if (!permission.isGranted) {
      print("yoq");
      permission = await Permission.storage.request();
    }
    print("fjlkaalksdfjasdf");
    print(permission.isGranted);

    return permission.isGranted;
  }
}
