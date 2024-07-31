
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestStoragePermission() async {
    final isGranted = await Permission.storage.isGranted;
    if (!isGranted) {
      print("yoq");
      await Permission.storage.request();
    }
    print("fjlkaalksdfjasdf");
    print(isGranted);

    return isGranted;
  }
}
