import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/global/permissions.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:meeps/providers/imagesProvider/images_provider.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:meeps/utility/image_utility.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as pathhh;
import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathh;
import 'package:flutter/services.dart' show rootBundle;

class MediaSlidingUpBlock extends StatefulWidget {
  @override
  _MediaSlidingUpBlockState createState() => _MediaSlidingUpBlockState();
}

class _MediaSlidingUpBlockState extends State<MediaSlidingUpBlock> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  bool showMediaSlide = true;
  List<dynamic> allMedia = [
    {'name': 'room1', 'media': 'assets/roomm.jpg', 'selected': false},
    {'name': 'aquarium1', 'media': 'assets/aquarium.png', 'selected': false},
    {'name': 'room2', 'media': 'assets/roomm.jpg', 'selected': false},
    {'name': 'aquarium2', 'media': 'assets/aquarium.png', 'selected': false},
    {'name': 'room3', 'media': 'assets/roomm.jpg', 'selected': false},
    {'name': 'aquarium3', 'media': 'assets/aquarium.png', 'selected': false},
    {'name': 'room4', 'media': 'assets/roomm.jpg', 'selected': false},
    {'name': 'aquarium4', 'media': 'assets/aquarium.png', 'selected': false},
    {'name': 'room5', 'media': 'assets/roomm.jpg', 'selected': false},
    {'name': 'aquarium5', 'media': 'assets/aquarium.png', 'selected': false},
  ];

  List<dynamic> selectedMedia = [];
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return !showMediaSlide
        ? SizedBox()
        : Align(
            alignment: Alignment.bottomCenter,
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                showMediaSlide = false;
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, screenWidth * 5, 0, 0),
                height: MediaQuery.of(context).size.height * .7,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 8),
                      topRight: Radius.circular(screenWidth * 8)),
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: screenWidth * .5,
                            width: screenWidth * 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: theme.lightTextColor?.withOpacity(.6))),
                      ),
                      SizedBox(
                        height: screenWidth * 7,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Recent',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontSize: screenWidth * 3.5),
                                ),
                                SizedBox(
                                  width: screenWidth * 2,
                                ),
                                SizedBox(
                                  height: screenWidth * 3,
                                  width: screenWidth * 4,
                                  child: Image.asset(
                                    'assets/arrow_down_icon.png',
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                await getImageFromGallery();
                                if (_imageFile != null) {
                                  postProvider.post.postPhotos.add(_imageFile!);
                                  print(postProvider.post.postPhotos);
                                }
                              },
                              child: Container(
                                height: screenWidth * 9,
                                width: screenWidth * 9,
                                padding: EdgeInsets.all(screenWidth * 2.5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: theme.appBackgroundColor,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Image.asset(
                                  'assets/camera.png',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenWidth,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .7,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: gridMedia(provData, context),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget gridMedia(StateSettingProvider provdata, BuildContext context) {
    var prov = Provider.of<PostProvider>(context, listen: false);
    return GridView.builder(
        padding: EdgeInsets.only(bottom: 200),
        itemCount: allMedia.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: .96),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              setState(() {
                allMedia[index]['selected'] = !allMedia[index]['selected'];
                if (allMedia[index]['selected']) {
                  selectedMedia.add(allMedia[index]);
                  print(allMedia[index]['media']);
                } else {
                  selectedMedia.remove(allMedia[index]);
                }
              });
              //'/data/user/0/com.goprogs.meeps/cache/assets/aquarium.png'
              // bool permissionCheck =
              //     await PermissionsService().requestStroagePermission();
              // if (permissionCheck) {
              //   if (allMedia[index]['selected']) {
              //     print(allMedia[index]['media']);
              //     String imageFilePath =
              //         await ImageUtility().getImagePath("roomm.jpg");
              //     print(imageFilePath);

              //     File imageFile = await File(imageFilePath);

              //     prov.post.postPhotos.add(imageFile);
              //     print(prov.post.postPhotos);
              //   } else {
              //     prov.post.postPhotos.remove('roomm.png');
              //   }
              // } else {
              //   permissionCheck =
              //       await PermissionsService().requestStroagePermission();
              // }
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(allMedia[index]['media']))),
                ),
                Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: allMedia[index]['selected']
                                ? theme.mainColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1.5,
                                color: allMedia[index]['selected']
                                    ? Colors.transparent
                                    : Colors.white)),
                        height: 20,
                        width: 20,
                        child: Text(
                          allMedia[index]['selected']
                              ? (selectedMedia.indexWhere((element) =>
                                          element['name'] ==
                                          allMedia[index]['name']) +
                                      1)
                                  .toString()
                              : '',
                          style: TextStyle(
                              color: allMedia[index]['selected']
                                  ? Colors.white
                                  : Colors.transparent,
                              fontSize: 13),
                        )))
              ],
            ),
          );
        });
  }

  Future<void> getImageFromGallery() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
      Provider.of<imagesProvider>(context, listen: false)
          .addNewPostPhotoTabImageFromGallery(_imageFile);
    });
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await pathh.getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
