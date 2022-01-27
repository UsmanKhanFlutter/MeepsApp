import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/open_chat_tab.dart';
import 'package:meeps/theme/colors.dart';

import 'aroundMeTab/around_me_tab.dart';

class AddChat extends StatefulWidget {
  const AddChat({Key? key}) : super(key: key);

  @override
  _AddChatState createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
  bool openChatSelected = true;
  bool aroundMeSelected = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        height: screenWidth * 37,
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 4),
                        decoration: BoxDecoration(
                            color: theme.appBackgroundColor,
                            boxShadow: AllShadows().boxShadow(),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(screenWidth * 4),
                                bottomRight: Radius.circular(screenWidth * 4))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Image.asset('assets/close_icon.png',
                                        width: screenWidth * 5.5,
                                        height: screenWidth * 5.5,
                                        color: theme.lightTextColor)),
                                Text(
                                  'Add chat',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: theme.darkTextColor,
                                      fontSize: screenWidth * 5),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Image.asset(
                                            'assets/group_info_icon.png',
                                            width: screenWidth * 4.5,
                                            height: screenWidth * 4.5,
                                            color: theme.lightTextColor)),
                                    SizedBox(
                                      width: screenWidth * 4,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Image.asset(
                                            'assets/search_icon.png',
                                            width: screenWidth * 4.5,
                                            height: screenWidth * 4.5,
                                            color: theme.lightTextColor)),
                                  ],
                                )
                              ],
                            ),
                            openChatOrAroundMe(screenWidth),
                          ],
                        )),
                    openChatSelected
                        ? OpenChatTab()
                        : aroundMeSelected
                            ? AroundMeTab()
                            : SizedBox()
                  ],
                ),
              ),
              bottomNavigationBar()
            ],
          )),
    );
  }

  Widget openChatOrAroundMe(screenWidth) {
    return Container(
      height: screenWidth * 13,
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 1.4),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(screenWidth * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Row(
        children: [
          Expanded(
              child: openChatSelected
                  ? Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            openChatSelected = true;
                            aroundMeSelected = false;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Open chat',
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
                          openChatSelected = true;
                          aroundMeSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: openChatSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Open chat',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    )),
          Expanded(
              child: aroundMeSelected
                  ? Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            openChatSelected = false;
                            aroundMeSelected = true;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Around me',
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
                          openChatSelected = false;
                          aroundMeSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: aroundMeSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Around me',
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
