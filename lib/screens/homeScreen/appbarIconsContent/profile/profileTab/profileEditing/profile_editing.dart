import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/models/user_model.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/providers/profile_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/avatarSettings/avatar_settings.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class ProfileEditing extends StatefulWidget {
  @override
  State<ProfileEditing> createState() => _ProfileEditingState();
}

class _ProfileEditingState extends State<ProfileEditing> {
  TextEditingController nationalityText = TextEditingController();
  TextEditingController introText = TextEditingController();
  TextEditingController tagText = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController idController = TextEditingController();
  bool nationalityValid = false;
  bool introValid = false;
  bool allFieldsValid = false;
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  List<String> popularTagsList = [
    'jeju',
    'busam 2 dyas 1 night',
    'namhe food trip',
    'domestic travel',
    'uk travel',
    'best food trip ever'
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    nationalityText.dispose();
    introText.dispose();
    tagText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Profile editing', screenWidth),
        body: FutureBuilder<DocumentSnapshot>(
            future: profileProvider.getUserProfileDetails(UserDetails.userId),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                nationalityText.text = snapshot.data!['user_nationality'];
                introText.text = snapshot.data!['user_introduction'];
                tagText.text = snapshot.data!['user_bio_tag'];
                dob.text = snapshot.data!['user_date_of_birth'];
                idController.text = snapshot.data!['user_name_id'];
                return Container(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * 4, 0, screenWidth * 4, 0),
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                        profilePicCircle(screenWidth,
                            snapshot.data!['user_profile_image_url']),
                        SizedBox(
                          height: screenWidth * 6,
                        ),
                        idField(screenWidth),
                        selfIntroductionField(screenWidth),
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: -1,
                            lightSource: LightSource.top,

                            shadowDarkColor: Colors.grey.shade100,
                            shadowLightColor: Colors.white,

                            // oppositeShadowLightSource: true,
                          ),
                          child: Container(
                            color: Colors.white,
                            height: 3,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: screenWidth * 4),
                        yearOfBirthField(
                          screenWidth,
                        ),
                        nationalityField(screenWidth),
                        selfIntroductionTagField(screenWidth),
                        SizedBox(
                          height: screenWidth * 2,
                        ),
                        Wrap(
                          children: [
                            for (int i = 0; i < popularTagsList.length; i++)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      tagText.text = popularTagsList[i];
                                      print(popularTagsList[i]);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(7),
                                        margin: const EdgeInsets.only(
                                            right: 10, bottom: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: theme.appBackgroundColor,
                                          boxShadow: AllShadows().boxShadow(
                                              darkBlurRadius: 3,
                                              darkSpreadRadius: 1,
                                              lightBlurRadius: 2,
                                              lightSpreadRadius: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(popularTagsList[i],
                                                style: TextStyle(
                                                    color: theme.lightTextColor,
                                                    fontSize: 12)),
                                            SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      theme.appBackgroundColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 4,
                                                        offset:
                                                            const Offset(1, 1),
                                                        spreadRadius: 1,
                                                        color: Colors
                                                            .grey.shade400),
                                                    const BoxShadow(
                                                        offset: Offset(-2, -2),
                                                        blurRadius: 4,
                                                        spreadRadius: 2,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.grey,
                                                  size: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 6,
                        ),
                        buttons(screenWidth, authenticationProvider),
                        SizedBox(
                          height: screenWidth * 10,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Loading...'),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget profilePicCircle(screenWidth, profileImage) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: screenWidth * 27,
        width: screenWidth * 27,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: _imageFile != null
                        ? DecorationImage(
                            fit: BoxFit.cover, image: FileImage(_imageFile!))
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(profileImage))),
              ),
            ),
            Positioned(
              bottom: screenWidth * 1,
              right: screenWidth * 1,
              child: GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: screenWidth * 7,
                  width: screenWidth * 7,
                  padding: EdgeInsets.all(screenWidth * 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset('assets/write.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getImageFromGallery() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
    });
  }

  idField(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ID',
          style: TextStyle(
              color: theme.darkTextColor,
              fontSize: screenWidth * 3.8,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: screenWidth * 1.5),
        Neumorphic(
            style: NeumorphicStyle(
                depth: -2,
                lightSource: LightSource.topLeft,
                intensity: 1,
                shadowDarkColorEmboss: Colors.grey.shade300,
                // oppositeShadowLightSource: true,
                shadowLightColorEmboss: Colors.white),
            child: TextField(
              controller: idController,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: screenWidth * 3.6,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.simpleButtonColor,
                border: InputBorder.none,
                hintText: 'lucky seven',
                hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: screenWidth * 3.6,
                    fontWeight: FontWeight.w400),
              ),
            )),
        SizedBox(height: screenWidth * 3)
      ],
    );
  }

  selfIntroductionField(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Self introduction',
          style: TextStyle(
              color: theme.darkTextColor,
              fontSize: screenWidth * 3.8,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: screenWidth * 1.5),
        Neumorphic(
            style: NeumorphicStyle(
                depth: -2,
                lightSource: LightSource.topLeft,
                intensity: 1,
                shadowDarkColorEmboss: Colors.grey.shade300,
                // oppositeShadowLightSource: true,
                shadowLightColorEmboss: Colors.white),
            child: TextField(
              controller: introText,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: screenWidth * 3.6,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.simpleButtonColor,
                border: InputBorder.none,
                hintText: 'Every travel,destination',
                hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: screenWidth * 3.6,
                    fontWeight: FontWeight.w400),
              ),
            )),
        SizedBox(height: screenWidth * 3)
      ],
    );
  }

  yearOfBirthField(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Year of birth',
          style: TextStyle(
              color: theme.darkTextColor,
              fontSize: screenWidth * 3.8,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: screenWidth * 1.5),
        Neumorphic(
            style: NeumorphicStyle(
                depth: -2,
                lightSource: LightSource.topLeft,
                intensity: 1,
                shadowDarkColorEmboss: Colors.grey.shade300,
                // oppositeShadowLightSource: true,
                shadowLightColorEmboss: Colors.white),
            child: TextField(
              controller: dob,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: screenWidth * 3.6,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.simpleButtonColor,
                border: InputBorder.none,
                hintText: '2002',
                hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: screenWidth * 3.6,
                    fontWeight: FontWeight.w400),
              ),
            )),
        SizedBox(height: screenWidth * 3)
      ],
    );
  }

  nationalityField(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nationality',
          style: TextStyle(
              color: theme.darkTextColor,
              fontSize: screenWidth * 3.8,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: screenWidth * 1.5),
        Neumorphic(
            style: NeumorphicStyle(
                depth: -2,
                lightSource: LightSource.topLeft,
                intensity: 1,
                shadowDarkColorEmboss: Colors.grey.shade300,
                // oppositeShadowLightSource: true,
                shadowLightColorEmboss: Colors.white),
            child: TextField(
              controller: nationalityText,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: screenWidth * 3.6,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.simpleButtonColor,
                border: InputBorder.none,
                hintText: 'South korea',
                hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: screenWidth * 3.6,
                    fontWeight: FontWeight.w400),
              ),
            )),
        SizedBox(height: screenWidth * 3)
      ],
    );
  }

  selfIntroductionTagField(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Self introduction tag',
          style: TextStyle(
              color: theme.darkTextColor,
              fontSize: screenWidth * 3.8,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: screenWidth * 1.5),
        Neumorphic(
            style: NeumorphicStyle(
                depth: -2,
                lightSource: LightSource.topLeft,
                intensity: 1,
                shadowDarkColorEmboss: Colors.grey.shade300,
                // oppositeShadowLightSource: true,
                shadowLightColorEmboss: Colors.white),
            child: TextField(
              controller: tagText,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: screenWidth * 3.6,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.simpleButtonColor,
                border: InputBorder.none,
                hintText: 'Introduce yourself using #tag',
                hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: screenWidth * 3.6,
                    fontWeight: FontWeight.w400),
              ),
            )),
        SizedBox(height: screenWidth * 2)
      ],
    );
  }

  Widget buttons(screenWidth, authenticationProvider) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              if (nationalityText.text.trim().isNotEmpty &&
                  introText.text.trim().isNotEmpty &&
                  tagText.text.trim().isNotEmpty &&
                  dob.text.trim().isNotEmpty &&
                  idController.text.trim().isNotEmpty) {
                User user = User();
                user.nationality = nationalityText.text;
                user.userIntroduction = introText.text;
                user.bioTag = tagText.text;
                if (_imageFile != null) {
                  user.profileImage = _imageFile;
                }
                user.dateOfBirth = dob.text;
                user.id = idController.text;
                user.userId = UserDetails.userId;
                await authenticationProvider.updateUserProfile(user);
                Fluttertoast.showToast(
                    msg: "Edit successfull",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
