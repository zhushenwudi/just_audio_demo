import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SDUtils {
  static String path = "";

  static init() async {
    Directory? appDocDir;
    if (Platform.isAndroid) {
      appDocDir = await getExternalStorageDirectory();
    }
    appDocDir ??= await getApplicationDocumentsDirectory();
    path = appDocDir.path + Platform.pathSeparator;
  }
}
