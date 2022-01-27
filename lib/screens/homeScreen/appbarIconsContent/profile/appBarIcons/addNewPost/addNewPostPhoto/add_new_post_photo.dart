import 'package:flutter/material.dart';
import 'package:meeps/providers/imagesProvider/images_provider.dart';
import 'package:provider/provider.dart';

import 'mediaSlidingUpBlock/media_sliding_up_block.dart';

class AddNewPostPhoto extends StatefulWidget {
  const AddNewPostPhoto({Key? key}) : super(key: key);

  @override
  _AddNewPostPhotoState createState() => _AddNewPostPhotoState();
}

class _AddNewPostPhotoState extends State<AddNewPostPhoto> {
  @override
  Widget build(BuildContext context) {
    var provData = Provider.of<imagesProvider>(context);
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: provData.addNewPostPhotoTabImageFile != null
              ? Image.file(
                  provData.addNewPostPhotoTabImageFile!,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/aquarium.png',
                  fit: BoxFit.cover,
                ),
        ),
        MediaSlidingUpBlock(),
      ],
    );
  }
}
