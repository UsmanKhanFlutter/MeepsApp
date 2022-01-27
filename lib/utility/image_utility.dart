import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ImageUtility {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<String> getImagePath(String name) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String imagePath = join(directory.path, name);
    return imagePath;
  }
}
