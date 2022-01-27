import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/signupWIthEmailPasswordprofileSettings/signup_with_email_password_profile_settings.dart';
import 'package:meeps/screens/homeScreen/home.dart';
import 'package:meeps/theme/colors.dart';
import 'package:meeps/utility/image_utility.dart';
import 'package:provider/provider.dart';

class profileSettingsChooseProfilePic extends StatefulWidget {
  @override
  State<profileSettingsChooseProfilePic> createState() =>
      _profileSettingsChooseProfilePicState();
}

class _profileSettingsChooseProfilePicState
    extends State<profileSettingsChooseProfilePic> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context),
        body: Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Choose your profile picture',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: theme.mainColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You can change it in settings anytime',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: theme.lightTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: theme.coloredButtonColor,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(1, 1),
                                    spreadRadius: 1,
                                    color: Colors.grey.shade600),
                                const BoxShadow(
                                    offset: Offset(-2, -2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    color: Colors.white),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              height: 100,
                              width: 100,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(authenticationProvider
                                              .userModel.profileImageUrl ??
                                          'assets/face_icons/female0.jpg'))),
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text('Avatar profile',
                              style: TextStyle(
                                  color: theme.darkTextColor, fontSize: 15))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(1, 1),
                                    spreadRadius: 1,
                                    color: Colors.grey.shade600),
                                const BoxShadow(
                                    offset: Offset(-2, -2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    color: Colors.white),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                getImageFromGallery();
                              },
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.circle,
                                      image: _imageFile != null
                                          ? DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(_imageFile!))
                                          : null),
                                  child: _imageFile != null
                                      ? const SizedBox()
                                      : Icon(
                                          Icons.photo_outlined,
                                          color: Colors.grey.shade600,
                                          size: 30,
                                        )

                                  // : ClipRRect(
                                  //     borderRadius:
                                  //         BorderRadius.circular(100),
                                  //     child: Image.file(_imageFile!,
                                  //         fit: BoxFit.fitWidth),
                                  //   )
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text('My photo profile',
                              style: TextStyle(
                                  color: theme.darkTextColor, fontSize: 15))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Neumorphic(
                style: AllShadows().neumorphicShadow(screenWidth, depth: 2),
                child: GestureDetector(
                  onTap: () async {
                    if (_imageFile == null) {
                      authenticationProvider.userModel.profileImage = File(
                          authenticationProvider.userModel.profileImageUrl ??
                              'assets/face_icons/female0.jpg');
                      print(authenticationProvider.userModel.profileImage);
                    } else {
                      authenticationProvider.userModel.profileImage =
                          _imageFile;
                      print(authenticationProvider.userModel.profileImage);
                    }
                    bool checkSignup = await authenticationProvider
                        .createUser(authenticationProvider.userModel);
                    if (checkSignup) {
                      Fluttertoast.showToast(
                          msg: "Signup Successful",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => home()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Signup Failed",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.coloredButtonColor,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(3, 3),
                            blurRadius: 6,
                            spreadRadius: 3,
                            color: Colors.grey.shade200),
                      ],
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////Widgets//////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  AppBar appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey.shade600,
          size: 18,
        ),
      ),
      title: Text(
        'Profile settings',
        style: TextStyle(color: theme.darkTextColor, fontSize: 20),
      ),
    );
  }

  void getImageFromGallery() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
    });
  }
}
