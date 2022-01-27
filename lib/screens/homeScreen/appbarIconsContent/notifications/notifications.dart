import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/theme/colors.dart';
import 'package:swipe_to/swipe_to.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Notification', screenWidth),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New notification',
                  style: TextStyle(
                      color: theme.darkTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 3; i++) newNotification(i),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New message request',
                  style: TextStyle(
                      color: theme.darkTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 1; i++) newMessageRequest(i),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New friend request',
                  style: TextStyle(
                      color: theme.darkTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 2; i++) newFriendRequest(i),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New message ',
                  style: TextStyle(
                      color: theme.darkTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 2; i++) newMessage(i),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////Widgets////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////

  Widget newNotification(i) {
    return Container(
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(13),
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
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/roomm.jpg'))
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: SizeConfig.widthMultiplier * 11,
                width: SizeConfig.widthMultiplier * 11,
                margin: EdgeInsets.all(7),
                padding: const EdgeInsets.all(3),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lucky_seven tagged you in a post.',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                  ],
                ),
              )),
          Container(
              width: SizeConfig.widthMultiplier * 16,
              padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 4),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '9:09 p.m.',
                    style: TextStyle(
                        color: theme.lightTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.widthMultiplier * 2.4),
                  )))
        ],
      ),
    );
  }

  Widget newMessageRequest(i) {
    return Container(
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(13),
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
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/roomm.jpg'))
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: SizeConfig.widthMultiplier * 11,
                width: SizeConfig.widthMultiplier * 11,
                margin: EdgeInsets.all(7),
                padding: const EdgeInsets.all(3),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lucky_seven',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                    Text(
                      'Hey,what\'s going on?Hey,what\'s going on?',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              )),
          Container(
              width: SizeConfig.widthMultiplier * 16,
              padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 4),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '9:09 p.m.',
                    style: TextStyle(
                        color: theme.lightTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.widthMultiplier * 2.4),
                  )))
        ],
      ),
    );
  }

  Widget newFriendRequest(i) {
    return Container(
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(13),
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
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/roomm.jpg'))
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: SizeConfig.widthMultiplier * 11,
                width: SizeConfig.widthMultiplier * 11,
                margin: EdgeInsets.all(7),
                padding: const EdgeInsets.all(3),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lucky_seven',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                    Text(
                      'The rebellion',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              )),
          Container(
              width: SizeConfig.widthMultiplier * 16,
              child: Align(
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    height: SizeConfig.widthMultiplier * 5,
                    width: SizeConfig.widthMultiplier * 13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: const Offset(1, 1),
                            spreadRadius: 1,
                            color: Colors.grey.shade400),
                        const BoxShadow(
                            offset: Offset(-2, -2),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.white70),
                      ],
                      color: theme.appBackgroundColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('accept',
                        style: TextStyle(
                            color: theme.mainColor,
                            fontSize: SizeConfig.widthMultiplier * 2.7)),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget newMessage(i) {
    return Container(
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(13),
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
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/roomm.jpg'))
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: SizeConfig.widthMultiplier * 11,
                width: SizeConfig.widthMultiplier * 11,
                margin: EdgeInsets.all(7),
                padding: const EdgeInsets.all(3),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lucky_seven',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                    Text(
                      'Hey,I will be late so don\'t wait for me.',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              )),
          Container(
              width: SizeConfig.widthMultiplier * 16,
              padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 4),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '9:09 p.m.',
                    style: TextStyle(
                        color: theme.lightTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.widthMultiplier * 2.4),
                  )))
        ],
      ),
    );
  }
}
