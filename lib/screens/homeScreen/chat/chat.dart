import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/screens/homeScreen/chat/chatTab/chat_tab.dart';
import 'package:meeps/screens/homeScreen/chat/friendTab/friend_tab.dart';
import 'package:meeps/theme/colors.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool friendSelected = true;
  bool chatSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            friendOrChat(),
            SizedBox(height: 10),
            friendSelected
                ? FriendTab()
                : chatSelected
                    ? ChatTab()
                    : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget friendOrChat() {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(right: 15, left: 15),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(15),
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
              child: friendSelected
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
                            friendSelected = true;
                            chatSelected = false;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Friend',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          friendSelected = true;
                          chatSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: friendSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Friend',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    )),
          Expanded(
              child: chatSelected
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
                            friendSelected = false;
                            chatSelected = true;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Chat',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          friendSelected = false;
                          chatSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: chatSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Chat',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    ))
        ],
      ),
    );
  }
}
