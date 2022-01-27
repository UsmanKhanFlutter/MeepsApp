import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/groupChat/group_chat.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CreateOpenChatPicture extends StatefulWidget {
  @override
  State<CreateOpenChatPicture> createState() => _CreateOpenChatPictureState();
}

class _CreateOpenChatPictureState extends State<CreateOpenChatPicture> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  List<dynamic> tagsList = [
    {'name': 'Honeymoon spot', 'selected': false},
    {'name': 'Weekend enjoyment', 'selected': false},
    {'name': 'Marriage', 'selected': false},
    {'name': 'jeju island', 'selected': false},
    {'name': 'Domestic travel', 'selected': false},
    {'name': 'World tour', 'selected': false},
    {'name': 'Beautiful destination', 'selected': false},
    {'name': 'Island', 'selected': false}
  ];

  void getImageFromGallery() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Add chat', screenWidth),
        body: Container(
          padding: EdgeInsets.all(screenWidth * 4),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 6, horizontal: screenWidth * 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(),
                      borderRadius: BorderRadius.circular(screenWidth * 3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenWidth * 3),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Honeymoon group buying\nof Zhansoonyi!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.4,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.widthMultiplier * 4.6),
                          ),
                        ),
                        SizedBox(height: screenWidth * 10),
                        Neumorphic(
                          style: AllShadows().neumorphicShadow(screenWidth,
                              depth: _imageFile != null ? 2 : -5, radius: 4),
                          child: GestureDetector(
                            onTap: () {
                              getImageFromGallery();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: screenWidth * 36,
                                width: screenWidth * 33,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    image: _imageFile != null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(_imageFile!))
                                        : null),
                                child: _imageFile != null
                                    ? SizedBox()
                                    : Icon(
                                        Icons.add,
                                        size: screenWidth * 7,
                                        color: theme.lightTextColor!
                                            .withOpacity(.5),
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: screenWidth * 6.5,
                              width: screenWidth * 6.5,
                              margin: EdgeInsets.only(bottom: screenWidth * .5),
                              padding: EdgeInsets.all(screenWidth * .8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      offset: const Offset(1, 1),
                                      spreadRadius: 1,
                                      color: Colors.grey.shade400),
                                  const BoxShadow(
                                      offset: Offset(-2, -2),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      color: Colors.white70),
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            'assets/face_icons/female3.jpg'))),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 2,
                            ),
                            Text('Lucky_seven',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 3)),
                            Text(' | ',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 4)),
                            SizedBox(
                              height: screenWidth * 3,
                              width: screenWidth * 3,
                              child: Image.asset('assets/person_icon.png',
                                  color: theme.lightTextColor),
                            ),
                            Text('  0/100',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 3))
                          ],
                        ),
                        SizedBox(height: screenWidth * 12),
                        tagsNamesList(screenWidth),
                        SizedBox(
                          height: screenWidth * 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth),
                child: Neumorphic(
                  style: AllShadows().neumorphicShadow(screenWidth,
                      depth: _imageFile != null ? 2 : -2),
                  child: GestureDetector(
                    onTap: () {
                      if (_imageFile != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GroupChat()));
                      }
                    },
                    child: Container(
                      height: screenWidth * 13,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _imageFile != null
                            ? theme.mainColor
                            : theme.appBackgroundColor,
                      ),
                      child: Text(
                        'Create chat',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _imageFile != null
                                ? Colors.white
                                : theme.lightTextColor,
                            fontSize: screenWidth * 3.8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tagsNamesList(screenWidth) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (int i = 0; i < tagsList.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(screenWidth * 2.2),
                    margin: EdgeInsets.only(
                        right: screenWidth * 3, bottom: screenWidth * 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 1.8),
                      color: tagsList[i]['selected']
                          ? theme.mainColor
                          : theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                    ),
                    child: Text(tagsList[i]['name'],
                        style: TextStyle(
                            color: tagsList[i]['selected']
                                ? Colors.white
                                : theme.lightTextColor,
                            fontSize: 12))),
              ),
            ],
          ),
      ],
    );
  }
}
