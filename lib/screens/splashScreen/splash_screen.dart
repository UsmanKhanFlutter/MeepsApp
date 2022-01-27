import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/screens/chooseSignIn/choose_signin.dart';
import 'package:meeps/screens/homeScreen/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  List<String> imagesList = [
    'male0',
    'male1',
    'female0',
    'female1',
    'female2',
    'male2',
    'female3',
    'male3',
    'male4',
    'female4',
    'male5',
    'female5',
    'female6',
    'female7',
    'male6',
  ];
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChooseSignin()));
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => home()));
    });
    timer = Timer.periodic(Duration(milliseconds: 800), (timer) {
      imagesList.shuffle();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Expanded(
                            child: SizedBox(
                          child: Row(
                            children: [
                              for (int i = 1; i < 4; i++)
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/face_icons/${imagesList[i]}.jpg'))),
                                )),
                            ],
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              for (int i = 4; i < 7; i++)
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/face_icons/${imagesList[i]}.jpg'))),
                                )),
                            ],
                          ),
                        )),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              for (int i = 7; i < 9; i++)
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/face_icons/${imagesList[i]}.jpg'))),
                                )),
                            ],
                          )),
                        ],
                      )),
                      Expanded(
                          flex: 2,
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Plan,Travel and Meet',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: screenWidth * 3.3,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Container(
                                    height: screenWidth * 8,
                                    width: screenWidth * 25,
                                    child: Image.asset('assets/logo.png'),
                                  )
                                ],
                              ))),
                    ],
                  )),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              for (int i = 9; i < 12; i++)
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/face_icons/${imagesList[i]}.jpg'))),
                                )),
                            ],
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              for (int i = 12; i < 15; i++)
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/face_icons/${imagesList[i]}.jpg'))),
                                )),
                            ],
                          ),
                        )),
                      ],
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
