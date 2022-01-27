import 'dart:io';

import 'package:flutter/cupertino.dart';

class imagesProvider with ChangeNotifier {
  File? addNewPostPhotoTabImageFile;
  addNewPostPhotoTabImageFromGallery(imageFile) {
    addNewPostPhotoTabImageFile = imageFile;
    notifyListeners();
  }
}
