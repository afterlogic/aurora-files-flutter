import 'package:permission_handler/permission_handler.dart';

import 'custom_exception.dart';

Future getStoragePermissions() async {
  PermissionStatus permission =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  if (permission != PermissionStatus.granted) {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    if (permissions.values.last != PermissionStatus.granted) {
      throw CustomException("Access denied");
    }
  }
}
