import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:meeps/screens/homeScreen/appbarIconsContent/search/search.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/add_chat.dart';
import 'package:meeps/screens/homeScreen/chat/chat.dart';
import 'package:meeps/screens/homeScreen/homeContent/home_content.dart';
import 'package:meeps/screens/homeScreen/popularPostAndFollowing/popular_post_and_following.dart';
import 'package:meeps/screens/homeScreen/store/store.dart';
import 'package:meeps/screens/homeScreen/youtube/youtube.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'appbarIconsContent/profile/profile.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool showSlide = true;

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
              provData.homeSelected
                  ? HomeContent()
                  : provData.youtubeSelected
                      ? Youtube()
                      : provData.popularPostAndFollowingSelected
                          ? PopularPostAndFollowing()
                          : provData.chatSelected
                              ? Chat()
                              : provData.storeSelected
                                  ? Store()
                                  : SizedBox(),
              !showSlide
                  ? SizedBox()
                  : SlidingUpPanel(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26)),
                      maxHeight: 300,
                      minHeight: 100,
                      panel: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('admin_ad_banner')
                              .snapshots(),
                          builder: (context, snapshot) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(26),
                                      topRight: Radius.circular(26)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/aeroplane.png'))),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showSlide = false;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/close_icon.png',
                                    height: screenWidth * 7,
                                    width: screenWidth * 7,
                                  ),
                                ),
                              ),
                            );
                          })),
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
        Provider.of<StateSettingProvider>(context).chatSelected
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AddChat()));
                },
                child: Container(
                  width: screenWidth * 9,
                  height: screenWidth * 5,
                  color: theme.appBackgroundColor,
                  child: Center(
                    child: Image.asset(
                      'assets/add_icon.png',
                      width: screenWidth * 5,
                      height: screenWidth * 5,
                    ),
                  ),
                ))
            : SizedBox(),
        GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => search()));
            },
            child: Container(
              width: screenWidth * 9,
              height: screenWidth * 5,
              color: theme.appBackgroundColor,
              child: Center(
                child: Image.asset(
                  'assets/search_icon.png',
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
              height: screenWidth * 5,
              color: theme.appBackgroundColor,
              child: Center(
                child: Image.asset(
                  'assets/notification_icon.png',
                  width: screenWidth * 5,
                  height: screenWidth * 5,
                ),
              ),
            )),
        GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              width: screenWidth * 9,
              height: screenWidth * 5,
              color: theme.appBackgroundColor,
              child: Center(
                child: Image.asset(
                  'assets/person_icon.png',
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
}
