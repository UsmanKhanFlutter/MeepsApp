import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/signupWithEmailTermsAndConditions/signup_with_email_terms_and_conditions.dart.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class SignupWithEmailPassswordConfirmation extends StatefulWidget {
  @override
  State<SignupWithEmailPassswordConfirmation> createState() =>
      _SignupWithEmailPassswordConfirmationState();
}

class _SignupWithEmailPassswordConfirmationState
    extends State<SignupWithEmailPassswordConfirmation> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  String? errorTextPassword = '';

  String? errorTextConfirmPassword = '';

  bool passwordValid = false;

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Sign up with email', screenWidth),
        body: Container(
          padding: const EdgeInsets.all(15),
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
                    'Password',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 6),
                  Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        controller: passwordController,
                        onChanged: (passwordValue) {
                          if (!authenticationProvider
                              .checkPasswordLenght(passwordValue.toString())) {
                            setState(() {
                              errorTextPassword =
                                  "Password length should be 8 characters atleast";
                            });
                          } else {
                            setState(() {
                              errorTextPassword = '';
                            });
                            authenticationProvider.userModel.password =
                                passwordValue;
                            log(authenticationProvider.userModel.password
                                .toString());
                          }
                          if (errorTextPassword!.isEmpty &&
                              errorTextConfirmPassword!.isEmpty &&
                              passwordController.text.length > 7 &&
                              passwordConfirmationController.text.length > 7) {
                            passwordValid = true;
                          } else {
                            passwordValid = false;
                          }
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter password',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  Text(
                    errorTextPassword ?? '',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Password confirmation',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 6),
                  Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        controller: passwordConfirmationController,
                        onChanged: (passwordValue) {
                          if (!authenticationProvider.matchPassword(
                              authenticationProvider.userModel.password
                                  .toString(),
                              passwordValue.toString())) {
                            setState(() {
                              errorTextConfirmPassword =
                                  "Password does not match";
                            });
                          } else {
                            setState(() {
                              errorTextConfirmPassword = "";
                            });

                            log(authenticationProvider.userModel.confirmPassword
                                .toString());
                          }
                          if (errorTextPassword!.isEmpty &&
                              errorTextConfirmPassword!.isEmpty &&
                              passwordController.text.length > 7 &&
                              passwordConfirmationController.text.length > 7) {
                            passwordValid = true;
                          } else {
                            passwordValid = false;
                          }
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Re-enter password',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  Text(
                    errorTextConfirmPassword ?? '',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Neumorphic(
                style: AllShadows().neumorphicShadow(screenWidth,
                    depth: passwordValid ? 2 : -2),
                child: GestureDetector(
                  onTap: () {
                    authenticationProvider.userModel.password =
                        passwordController.text.toString();
                    authenticationProvider.userModel.confirmPassword =
                        passwordConfirmationController.text.toString();
                    if (authenticationProvider.checkValidPassword(
                        authenticationProvider.userModel.password.toString(),
                        authenticationProvider.userModel.confirmPassword
                            .toString())) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SignupWithEmailTermsAndConditions()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Invalid password",
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
                      color: passwordValid
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
                          color: passwordValid
                              ? Colors.white
                              : theme.lightTextColor,
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
}
