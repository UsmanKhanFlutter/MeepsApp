import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/search/search.dart';
import 'package:meeps/theme/colors.dart';

class AllFriendsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context, screenWidth),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth * 6,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                    child: Text(
                      'Friend',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontSize: screenWidth * 4.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 2,
                  ),
                  for (int i = 0; i < 3; i++) friendsList(i, screenWidth),
                  SizedBox(
                    height: screenWidth * 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                    child: Text(
                      'View all',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontSize: screenWidth * 4.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 2,
                  ),
                  for (int i = 0; i < 10; i++) friendsList(i, screenWidth)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////Widgets////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////

  Widget friendsList(i, screenWidth) {
    return Container(
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: AllShadows().boxShadow()),
      margin: EdgeInsets.only(
          right: screenWidth * 4,
          bottom: screenWidth * 3,
          left: screenWidth * 4),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: SizeConfig.widthMultiplier * 11,
                width: SizeConfig.widthMultiplier * 11,
                margin: EdgeInsets.all(screenWidth * 2),
                padding: EdgeInsets.all(screenWidth * .8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                        spreadRadius: 1,
                        color: Colors.grey.shade300),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/face_icons/male$i.jpg'))),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'twenty_five_lucky',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                    SizedBox(
                      height: screenWidth,
                    ),
                    Text(
                      'Everyday travel, destination',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  AppBar appBar(context, screenWidth) {
    return AppBar(
      shadowColor: theme.lightTextColor!.withOpacity(.3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 3),
              bottomRight: Radius.circular(screenWidth * 3))),
      backgroundColor: theme.appBackgroundColor,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: theme.appBackgroundColor,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 4.8),
            child: Image.asset(
              'assets/close_icon.png',
              color: Color(0xffAFBBD9),
            ),
          ),
        ),
      ),
      title: Text(
        'Lucky',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
      actions: [
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
        SizedBox(
          width: screenWidth * 2,
        ),
      ],
    );
  }
}
