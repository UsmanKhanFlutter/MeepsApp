import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> requestStroagePermission() async {
    var result = await Permission.storage.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
    return false;
  }
}
