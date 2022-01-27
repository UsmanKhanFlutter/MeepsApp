import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/notifications/notifications.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/add_new_post.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/profile_tab.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/slidingPage2/sliding_page2_filter.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool profileSelected = true;
  bool myPageSelected = false;
  @override
  Widget build(BuildContext context) {
    var provData = Provider.of<StateSettingProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context, screenWidth),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, screenWidth * 4, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            profileOrMyPage(screenWidth),
                            profileSelected
                                ? ProfileTab()
                                : myPageSelected
                                    ? SizedBox()
                                    : SizedBox(),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              !provData.showProfileTabSlidingPage2Filter
                  ? SizedBox()
                  : SlidingPage2Filter(),
              bottomNavigationBar()
            ],
          ),
        ),
      ),
    );
  }
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

  AppBar appBar(context, screenWidth) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset(
        'assets/logo.png',
        width: screenWidth * 20,
      ),
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddNewPost()));
            },
            child: Container(
              width: screenWidth * 9,
              color: theme.appBackgroundColor,
              child: Center(
                child: Image.asset(
                  'assets/add_icon.png',
                  width: screenWidth * 5,
                  height: screenWidth * 5,
                ),
              ),
            )),
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            child: Container(
              width: screenWidth * 9,
              color: theme.appBackgroundColor,
              child: Center(
                child: Image.asset(
                  'assets/settings_icon.png',
                  width: screenWidth * 5,
                  height: screenWidth * 5,
                ),
              ),
            )),
        SizedBox(
          width: screenWidth * 2,
        ),
      ],
    );
  }

  Widget profileOrMyPage(screenWidth) {
    return Container(
      height: screenWidth * 13,
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 1.4),
      margin: EdgeInsets.only(right: screenWidth * 4, left: screenWidth * 4),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(screenWidth * 3),
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 4,
              spreadRadius: 2,
              color: Colors.grey.shade300),
          BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.white),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: profileSelected
                  ? Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            profileSelected = true;
                            myPageSelected = false;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Profile',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          profileSelected = true;
                          myPageSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: profileSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Profile',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    )),
          Expanded(
              child: myPageSelected
                  ? Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            profileSelected = false;
                            myPageSelected = true;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('My page',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          profileSelected = false;
                          myPageSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: myPageSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('My page',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    ))
        ],
      ),
    );
  }
}
