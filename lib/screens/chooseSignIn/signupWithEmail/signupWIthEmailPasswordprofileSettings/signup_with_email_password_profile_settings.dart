import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/signupWIthEmailPasswordprofileSettings/profileSettings2/profile_settings2.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class SignupWithEmailPassswordProfileSettings extends StatefulWidget {
  @override
  State<SignupWithEmailPassswordProfileSettings> createState() =>
      _SignupWithEmailPassswordProfileSettingsState();
}

class _SignupWithEmailPassswordProfileSettingsState
    extends State<SignupWithEmailPassswordProfileSettings> {
  TextEditingController id = TextEditingController();
  TextEditingController dob = TextEditingController();

  bool idValid = false;

  bool dobValid = false;
  bool allFieldsValid = false;

  @override
  void dispose() {
    // TODO: implement dispose
    id.dispose();
    dob.dispose();
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
          padding: EdgeInsets.all(screenWidth * 4),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        controller: id,
                        onChanged: (value) {
                          setState(() {
                            if (id.text.length > 0) {
                              idValid = true;
                              if (idValid && dobValid) {
                                allFieldsValid = true;
                              }
                            } else {
                              idValid = false;
                              allFieldsValid = false;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter ID',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  SizedBox(
                    height: screenWidth * 3,
                  ),
                  Text(
                    'Year of birth',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenWidth * 1.5),
                  Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        controller: dob,
                        onChanged: (value) {
                          setState(() {
                            if (dob.text.length > 0) {
                              dobValid = true;
                              if (dobValid && idValid) {
                                allFieldsValid = true;
                              }
                            } else {
                              dobValid = false;
                              allFieldsValid = false;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter year of birth',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  Neumorphic(
                    style: AllShadows().neumorphicShadow(screenWidth,
                        depth: allFieldsValid ? 2 : -2),
                    child: GestureDetector(
                      onTap: () {
                        if (allFieldsValid) {
                          if (id.text.trim() != '' && dob.text.trim() != '') {
                            authenticationProvider.userModel.id =
                                id.text.toString();
                            authenticationProvider.userModel.dateOfBirth =
                                dob.text.toString();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfileSettings2()));
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
                        height: screenWidth * 13,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: allFieldsValid
                              ? theme.mainColor
                              : theme.simpleButtonColor,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: allFieldsValid
                                  ? Colors.white
                                  : theme.lightTextColor,
                              fontSize: screenWidth * 3.8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
