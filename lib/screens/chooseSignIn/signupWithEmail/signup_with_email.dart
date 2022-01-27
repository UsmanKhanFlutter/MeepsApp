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
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

import 'signupWithEmailPasswordConfirmation/signup_with_email_password_confirmation.dart';

class SignupWithEmail extends StatefulWidget {
  @override
  State<SignupWithEmail> createState() => _SignupWithEmailState();
}

class _SignupWithEmailState extends State<SignupWithEmail> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  String errorText = '';
  String nameErrorText = '';
  bool emailValid = false;
  bool nameValid = false;
  Pattern namePattern = r"^[0-9]";
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Sign up with email', screenWidth),
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
                    'Name',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenWidth * 1.5),
                  Neumorphic(
                      style: NeumorphicStyle(
                          depth: emailValid ? 2 : -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                        ],
                        controller: name,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          suffixIconConstraints: BoxConstraints(maxWidth: 25),
                          suffixIcon: !nameValid
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.done,
                                      size: screenWidth * 4,
                                      color: theme.mainColor),
                                ),
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenWidth * 1.5),
                  Neumorphic(
                      style: NeumorphicStyle(
                          depth: emailValid ? 2 : -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: TextField(
                        onChanged: (value) {
                          RegExp regex = new RegExp(pattern.toString());
                          var check = value;
                          setState(() {
                            if (!regex.hasMatch(check)) {
                              errorText = 'Email is invalid';
                            } else {
                              errorText = '';
                            }
                            if (email.text.trim().isEmpty) {
                              errorText = '';
                            }
                            if (email.text.length > 0 &&
                                regex.hasMatch(check)) {
                              emailValid = true;
                            } else {
                              emailValid = false;
                            }
                          });
                        },
                        controller: email,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          suffixIconConstraints: BoxConstraints(maxWidth: 25),
                          suffixIcon: !emailValid
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.done,
                                      size: screenWidth * 4,
                                      color: theme.mainColor),
                                ),
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter email address',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 1, top: screenWidth * 1),
                    child: Text(
                      errorText,
                      style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: screenWidth * 2.8),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth),
                child: Neumorphic(
                  style: AllShadows().neumorphicShadow(screenWidth,
                      depth: emailValid ? 2 : -2),
                  child: GestureDetector(
                    onTap: () async {
                      if (emailValid && name.text.trim().isNotEmpty) {
                        authenticationProvider.userModel.email = email.text;
                        authenticationProvider.userModel.name = name.text;
                        bool checkEmailExist =
                            await authenticationProvider.checkIfEmailInUse(
                                authenticationProvider.userModel.email
                                    .toString());
                        if (!checkEmailExist) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  SignupWithEmailPassswordConfirmation()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Email already registered",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Invalid details",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Container(
                      height: screenWidth * 13,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: emailValid
                            ? theme.mainColor
                            : theme.simpleButtonColor,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: emailValid
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

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////Widgets//////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

}
