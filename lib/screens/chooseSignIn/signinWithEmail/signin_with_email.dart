import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/homeScreen/home.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class SigninWithEmail extends StatefulWidget {
  @override
  State<SigninWithEmail> createState() => _SigninWithEmailState();
}

class _SigninWithEmailState extends State<SigninWithEmail> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorTextEmail = '';
  bool emailValid = false;
  String errorTextPassword = '';
  bool passwordValid = false;
  bool allFieldsValid = false;

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Sign in with email', screenWidth),
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
                    'Email',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenWidth * 1.5),
                  Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        controller: email,
                        onChanged: (value) {
                          setState(() {
                            // if (!email.text.endsWith('@gmail.com') &&
                            //     !email.text.endsWith('@yahoo.com') &&
                            //     !email.text.endsWith('@hotmail.com')) {
                            //   errorTextEmail = 'Email is invalid';
                            // }
                            if (!email.text.contains('@')) {
                              errorTextEmail = 'Email is invalid';
                            } else {
                              errorTextEmail = '';
                            }
                            if (email.text.isEmpty) {
                              errorTextEmail = '';
                            }
                            // if (email.text.length > 0 &&
                            //         email.text.endsWith('@gmail.com') ||
                            //     email.text.endsWith('@yahoo.com') ||
                            //     email.text.endsWith('@hotmail.com'))
                            if (email.text.length > 0 &&
                                email.text.contains('@')) {
                              emailValid = true;
                              if (passwordValid && emailValid) {
                                allFieldsValid = true;
                              }
                            } else {
                              emailValid = false;
                              allFieldsValid = false;
                            }
                          });
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
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
                  email.text.length == 0 || emailValid
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 1, top: screenWidth * 1),
                          child: Text(
                            errorTextEmail,
                            style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: screenWidth * 2.8),
                          ),
                        ),
                  SizedBox(
                    height: screenWidth * 3,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenWidth * 1.5),
                  Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            if (password.text.length < 8 &&
                                password.text.length > 0) {
                              errorTextPassword =
                                  'Password should be atleast 8 characters long';
                            } else {
                              errorTextPassword = '';
                            }
                            if (password.text.isEmpty) {
                              errorTextPassword = '';
                            }
                            if (password.text.length > 7) {
                              passwordValid = true;
                              if (passwordValid && emailValid) {
                                allFieldsValid = true;
                              }
                            } else {
                              passwordValid = false;
                              allFieldsValid = false;
                            }
                          });
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter password',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  password.text.length == 0 || passwordValid
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 1, top: screenWidth * 1),
                          child: Text(
                            errorTextPassword,
                            style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: screenWidth * 2.8),
                          ),
                        ),
                ],
              ),
              Column(
                children: [
                  Neumorphic(
                    style: AllShadows().neumorphicShadow(screenWidth,
                        depth: allFieldsValid ? 2 : -2),
                    child: GestureDetector(
                      onTap: () async {
                        // await authenticationProvider.signOut();
                        bool checkSignin =
                            await authenticationProvider.userSignin(
                                email.text.trim().toString(),
                                password.text.trim().toString());
                        if (checkSignin) {
                          Fluttertoast.showToast(
                              msg: "SignIn Successful",
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
                              msg: "SignIn Failed",
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
                          color: allFieldsValid
                              ? theme.mainColor
                              : theme.simpleButtonColor,
                        ),
                        child: Text(
                          'Login',
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
                    height: screenWidth * 3,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: theme.lightTextColor,
                          fontSize: screenWidth * 3.2),
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
