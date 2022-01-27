import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/chooseSignIn/signUpWithEmail/signup_with_email.dart';
import 'package:meeps/screens/homeScreen/home.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

import 'signinWithEmail/signin_with_email.dart';

class ChooseSignin extends StatefulWidget {
  @override
  _ChooseSigninState createState() => _ChooseSigninState();
}

class _ChooseSigninState extends State<ChooseSignin> {
  bool moreClicked = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset('assets/logo.png',
                  height: screenWidth * 12, width: double.infinity),
              Column(
                children: [
                  SizedBox(
                    height: screenWidth * 48,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/sign_in_icons.gif',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  moreClicked
                      ? Container()
                      : GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: screenWidth * 26,
                            padding: EdgeInsets.all(screenWidth * 1.2),
                            margin: EdgeInsets.only(top: screenWidth * 4),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 20),
                              color: theme.appBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(3, 3),
                                    blurRadius: 6,
                                    spreadRadius: 3,
                                    color: Colors.grey.shade300),
                                BoxShadow(
                                    offset: const Offset(-3, -3),
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    color: Colors.white70),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Simple ',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: screenWidth * 2.8),
                                ),
                                Text(
                                  'SNS login',
                                  style: TextStyle(
                                      color: theme.mainColor,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                  SizedBox(
                    height: screenWidth * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // miniButtons('message_icon', screenWidth),
                      // miniButtons('n_icon', screenWidth),
                      miniButtons('facebook_icon', screenWidth),
                      miniButtons('google_icon', screenWidth),
                      miniButtons('twitter_icon', screenWidth),
                      // moreClicked
                      //     ? miniButtons('google_icon', screenWidth)
                      //     : miniButtons('more_vert', screenWidth),
                    ],
                  ),
                  // !moreClicked
                  //     ? Container()
                  //     : Padding(
                  //         padding: EdgeInsets.only(top: screenWidth * 4),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             Container(),
                  //             Container(),
                  //             Container(),
                  //             miniButtons2('apple_icon', screenWidth),
                  //             miniButtons2('twitter_icon', screenWidth),
                  //             Container(),
                  //             Container(),
                  //             Container()
                  //           ],
                  //         ),
                  //       ),
                  SizedBox(
                    height: screenWidth * 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SigninWithEmail()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: screenWidth * 13,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 2),
                        color: theme.simpleButtonColor,
                        boxShadow: AllShadows().boxShadow(),
                      ),
                      child: Text(
                        'Email Login',
                        style: TextStyle(
                            color: theme.lightTextColor,
                            fontSize: screenWidth * 3.8,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 6,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupWithEmail()));
                      },
                      child: Text('Create Meep\'s account',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: theme.lightTextColor,
                              fontSize: screenWidth * 3.2))),
                  SizedBox(
                    height: screenWidth * 18,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  //////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////Widgets/////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////

  Widget miniButtons(name, screenWidth) {
    return GestureDetector(
      onTap: () async {
        if (name == 'more_vert') {
          setState(() {
            moreClicked = true;
          });
        }

        if (name == 'google_icon') {
          final authenticationProvider =
              Provider.of<AuthenticationProvider>(context, listen: false);
          User? user = await authenticationProvider.signInWithGoogle();
          if (user != null) {
            // print(user.email);
            // print(user.displayName);
            // print(user.photoURL);
            // print(user.uid);
            authenticationProvider.userModel.email = user.email;
            authenticationProvider.userModel.name = user.displayName;
            authenticationProvider.userModel.profileImageUrl = user.photoURL;
            authenticationProvider.userModel.id = user.uid;
            DocumentSnapshot<Object?> snapshot01 =
                await authenticationProvider.getUserDetailsFromId(user.uid);
            if (snapshot01.exists) {
              UserDetails.userId = user.uid;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => home()));
            } else {
              bool check = await authenticationProvider
                  .createUserWithGoogle(authenticationProvider.userModel);
              if (check) {
                Fluttertoast.showToast(
                    msg: "SignIn Successful",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                UserDetails.userId = user.uid;
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => home()));
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
            }
          }
        }

        if (name == 'facebook_icon') {
          final authenticationProvider =
              Provider.of<AuthenticationProvider>(context, listen: false);
          UserCredential userCredential =
              await authenticationProvider.signInWithFacebook();

          if (userCredential != null) {
            bool checkEmailExist = await authenticationProvider
                .checkIfEmailInUse(userCredential.user!.email.toString());
            if (checkEmailExist) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => home()));
            } else {
              authenticationProvider.userModel.email =
                  userCredential.user!.email;
              authenticationProvider.userModel.name =
                  userCredential.user!.displayName;
              authenticationProvider.userModel.profileImageUrl =
                  userCredential.user!.photoURL;
              authenticationProvider.userModel.id = userCredential.user!.uid;
              bool checkUserCreated = await authenticationProvider
                  .createUserWithFacebook(authenticationProvider.userModel);
              if (checkUserCreated) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => home()));
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
            }
            // print(userCredential.user!.email);
            // print(userCredential.user!.displayName);
            // print(userCredential.user!.phoneNumber);
            // print(userCredential.user!.photoURL);
            // print(userCredential.user!.uid);
            // print(userCredential.user!.isAnonymous);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => home()));
          }
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
        height: screenWidth * 14,
        width: screenWidth * 14,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 6,
                spreadRadius: 3,
                color: Colors.grey.shade300),
            BoxShadow(
                offset: const Offset(-3, -3),
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.white70),
          ],
        ),
        child: name == 'more_vert'
            ? Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              )
            : Image.asset(
                'assets/$name.png',
                height: name == 'facebook_icon'
                    ? screenWidth * 10
                    : screenWidth * 5,
                width: name == 'facebook_icon'
                    ? screenWidth * 12
                    : screenWidth * 5,
                fit: BoxFit.contain,
              ),
      ),
    );
  }

  Widget miniButtons2(name, screenWidth) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(name == 'twitter_icon' ? 10 : 12),
        height: screenWidth * 11,
        width: screenWidth * 11,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 6,
                spreadRadius: 3,
                color: Colors.grey.shade300),
            BoxShadow(
                offset: const Offset(-3, -3),
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.white70),
          ],
        ),
        child: Image.asset(
          'assets/$name.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
