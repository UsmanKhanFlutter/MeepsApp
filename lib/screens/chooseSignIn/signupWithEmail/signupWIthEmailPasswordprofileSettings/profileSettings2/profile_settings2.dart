import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/avatarSettings/avatar_settings.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class ProfileSettings2 extends StatefulWidget {
  @override
  State<ProfileSettings2> createState() => _ProfileSettings2State();
}

class _ProfileSettings2State extends State<ProfileSettings2> {
  TextEditingController nationalityText = TextEditingController();
  TextEditingController introText = TextEditingController();
  TextEditingController tagText = TextEditingController();
  bool nationalityValid = false;
  bool introValid = false;
  bool allFieldsValid = false;

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
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Profile settings', screenWidth),
        body: Container(
          padding: EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nationality',
                              style: TextStyle(
                                  color: theme.darkTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 6),
                            Neumorphic(
                                style:
                                    AllShadows().neumorphicShadow(screenWidth),
                                child: TextField(
                                  controller: nationalityText,
                                  onChanged: (value) {
                                    setState(() {
                                      if (nationalityText.text.length > 0) {
                                        nationalityValid = true;
                                        if (nationalityValid && introValid) {
                                          allFieldsValid = true;
                                        }
                                      } else {
                                        nationalityValid = false;
                                        allFieldsValid = false;
                                      }
                                    });
                                  },
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: theme.simpleButtonColor,
                                    border: InputBorder.none,
                                    hintText: 'Enter nationality',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Self introduction',
                              style: TextStyle(
                                  color: theme.darkTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 6),
                            Neumorphic(
                                style:
                                    AllShadows().neumorphicShadow(screenWidth),
                                child: TextField(
                                  controller: introText,
                                  onChanged: (value) {
                                    setState(() {
                                      if (introText.text.length > 0) {
                                        introValid = true;
                                        if (nationalityValid && introValid) {
                                          allFieldsValid = true;
                                        }
                                      } else {
                                        introValid = false;
                                        allFieldsValid = false;
                                      }
                                    });
                                  },
                                  maxLines: null,
                                  maxLength: 40,
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: theme.simpleButtonColor,
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintText: 'Maximum 10 words',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Self introduction tag',
                              style: TextStyle(
                                  color: theme.darkTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 6),
                            Neumorphic(
                                style:
                                    AllShadows().neumorphicShadow(screenWidth),
                                child: TextField(
                                  controller: tagText,
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: theme.simpleButtonColor,
                                    border: InputBorder.none,
                                    hintText: 'Introduce yourself using #tag',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i < popularTagsList.length; i++)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    authenticationProvider.userModel.bioTag =
                                        popularTagsList[i];
                                    print(popularTagsList[i]);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(7),
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                              padding: const EdgeInsets.all(2),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: theme.appBackgroundColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 4,
                                                      offset:
                                                          const Offset(1, 1),
                                                      spreadRadius: 1,
                                                      color:
                                                          Colors.grey.shade400),
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
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Neumorphic(
                  style: AllShadows().neumorphicShadow(screenWidth,
                      depth: allFieldsValid ? 2 : -2),
                  child: GestureDetector(
                    onTap: () {
                      if (allFieldsValid) {
                        if (introText.text.trim().isNotEmpty &&
                            nationalityText.text.trim().isNotEmpty &&
                            tagText.text.trim().isNotEmpty &&
                            authenticationProvider.userModel.bioTag != '') {
                          authenticationProvider.userModel.nationality =
                              nationalityText.text;
                          authenticationProvider.userModel.userIntroduction =
                              introText.text;
                          authenticationProvider.userModel.bio = tagText.text;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AvatarSettings()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please provide required details",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: allFieldsValid
                            ? theme.coloredButtonColor
                            : theme.simpleButtonColor,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(3, 3),
                              blurRadius: 6,
                              spreadRadius: 3,
                              color: Colors.grey.shade200),
                        ],
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: allFieldsValid
                                ? Colors.white
                                : theme.lightTextColor,
                            fontSize: 15),
                      ),
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
}
