import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/signupWIthEmailPasswordprofileSettings/signup_with_email_password_profile_settings.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class SignupWithEmailTermsAndConditions extends StatefulWidget {
  @override
  State<SignupWithEmailTermsAndConditions> createState() =>
      _SignupWithEmailTermsAndConditionsState();
}

class _SignupWithEmailTermsAndConditionsState
    extends State<SignupWithEmailTermsAndConditions> {
  bool allTermsSelected = false;
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
                  const SizedBox(height: 20),
                  Text(
                    'Agreement to terms and conditions',
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  for (int i = 0; i < listOfPoints.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                listOfPoints[i]['content'],
                                style: TextStyle(
                                    color: theme.darkTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   listOfPoints[i]['selected'] =
                              //       !listOfPoints[i]['selected'];
                              // });

                              // listOfPoints.every((element) {
                              //   if (element['selected'] == false) {
                              //     allTermsSelected = false;
                              //     return false;
                              //   } else {
                              //     allTermsSelected = true;
                              //     return true;
                              //   }
                              // });
                              setState(() {});
                              listOfPoints[i]['selected'] =
                                  !listOfPoints[i]['selected'];
                              if (listOfPoints[0]['selected']) {
                                listOfPoints.forEach((element) {
                                  element['selected'] = true;
                                  allTermsSelected = true;
                                });
                              } else {
                                listOfPoints.forEach((element) {
                                  element['selected'] = false;
                                  allTermsSelected = false;
                                });
                              }
                            },
                            child: Container(
                              height: 26,
                              width: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: theme.appBackgroundColor,
                                boxShadow: AllShadows().boxShadow(),
                              ),
                              child: !listOfPoints[i]['selected']
                                  ? Container()
                                  : Icon(
                                      Icons.done,
                                      color: theme.mainColor,
                                      size: 14,
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              Neumorphic(
                style: AllShadows().neumorphicShadow(screenWidth,
                    depth: allTermsSelected ? 2 : -2),
                child: GestureDetector(
                  onTap: () {
                    if (authenticationProvider
                        .checkTermsAndConditions(listOfPoints)) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SignupWithEmailPassswordProfileSettings()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Accept all terms and conditions",
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
                      color: allTermsSelected
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
                          color: allTermsSelected
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

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////Widgets//////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  List<dynamic> listOfPoints = [
    {
      'content': 'Agree with all the terms and conditions below',
      'required': false,
      'selected': false
    },
    {
      'content': '(Required)You must be 14 years of age or older',
      'required': true,
      'selected': false
    },
    {
      'content': '(Required)Terms of service',
      'required': true,
      'selected': false
    },
    {
      'content':
          '(Required)Consent to collection and use of personal information',
      'required': true,
      'selected': false
    },
    {
      'content': 'Consent to use of location service',
      'required': true,
      'selected': false
    },
    {
      'content': 'Agree to information on events and discounts',
      'required': true,
      'selected': false
    },
  ];
}
