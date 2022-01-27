import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/aroundMeTab/useMyLocation/use_my_location.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/nameOfChat/create_open_chat_name.dart';
import 'package:meeps/theme/colors.dart';

class AroundMeTab extends StatefulWidget {
  const AroundMeTab({Key? key}) : super(key: key);

  @override
  _AroundMeTabState createState() => _AroundMeTabState();
}

class _AroundMeTabState extends State<AroundMeTab> {
  bool showUseMyLocation = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return showUseMyLocation
        ? UseMyLocation()
        : Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidth * 4,
                  ),
                  Container(
                      height: screenWidth * 80,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: screenWidth * 80,
                            width: screenWidth * 80,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.grey.shade300)
                              ],
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(screenWidth * 100)),
                                  depth: -3,
                                  lightSource: LightSource.topLeft,
                                  intensity: 1,
                                  shadowDarkColorEmboss: Colors.grey.shade200,
                                  // oppositeShadowLightSource: true,
                                  shadowLightColorEmboss: Colors.grey.shade200),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: screenWidth * 60,
                            width: screenWidth * 60,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.grey.shade300)
                              ],
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(screenWidth * 100)),
                                  depth: -3,
                                  lightSource: LightSource.topLeft,
                                  intensity: 1,
                                  shadowDarkColorEmboss: Colors.grey.shade200,
                                  // oppositeShadowLightSource: true,
                                  shadowLightColorEmboss: Colors.grey.shade200),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: screenWidth * 40,
                            width: screenWidth * 40,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.grey.shade300)
                              ],
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(screenWidth * 100)),
                                  depth: -3,
                                  lightSource: LightSource.topLeft,
                                  intensity: 1,
                                  shadowDarkColorEmboss: Colors.grey.shade200,
                                  // oppositeShadowLightSource: true,
                                  shadowLightColorEmboss: Colors.grey.shade200),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: screenWidth * 28,
                            width: screenWidth * 28,
                            decoration: BoxDecoration(
                                color: theme.appBackgroundColor,
                                shape: BoxShape.circle,
                                boxShadow: AllShadows().boxShadow()),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/face_icons/male5.jpg'))),
                            ),
                          ),
                          Positioned(
                              left: screenWidth * 12,
                              top: screenWidth * 12,
                              child: Container(
                                height: screenWidth * 10,
                                width: screenWidth * 10,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/face_icons/male6.jpg'))),
                                ),
                              )),
                          Positioned(
                              left: screenWidth * 12,
                              bottom: screenWidth * 12,
                              child: Container(
                                height: screenWidth * 7,
                                width: screenWidth * 7,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/face_icons/male7.jpg'))),
                                ),
                              )),
                          Positioned(
                              left: screenWidth * 20,
                              bottom: screenWidth * 30,
                              child: Container(
                                height: screenWidth * 9,
                                width: screenWidth * 9,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/face_icons/male8.jpg'))),
                                ),
                              )),
                          Positioned(
                              right: screenWidth * 20,
                              bottom: screenWidth * 20,
                              child: Container(
                                height: screenWidth * 13,
                                width: screenWidth * 13,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/face_icons/male9.jpg'))),
                                ),
                              )),
                          Positioned(
                              right: screenWidth * 27,
                              top: screenWidth * 10,
                              child: Container(
                                height: screenWidth * 10,
                                width: screenWidth * 10,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/face_icons/female3.jpg'))),
                                ),
                              )),
                          Positioned(
                              left: screenWidth * 45,
                              bottom: screenWidth * 10,
                              child: Container(
                                height: screenWidth * 9,
                                width: screenWidth * 9,
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow()),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/face_icons/female4.jpg'))),
                                ),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: screenWidth * 5,
                  ),
                  Text('Meet people and make\ntravel more fun!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenWidth * 6,
                          color: theme.mainColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: screenWidth * 3,
                  ),
                  Text(
                      'Turn on the location option to see different\npeople around you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenWidth * 3.5,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: screenWidth * 10,
                  ),
                  Neumorphic(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                    style: AllShadows().neumorphicShadow(screenWidth, depth: 2),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showUseMyLocation = true;
                        });
                      },
                      child: Container(
                        height: screenWidth * 13,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.mainColor,
                        ),
                        child: Text(
                          'Use my location',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: screenWidth * 3.8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          );
  }
}
