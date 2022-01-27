import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/theme/colors.dart';
import 'package:swipe_to/swipe_to.dart';

class ChatTab extends StatefulWidget {
  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  List listOfChats = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < listOfChats.length; i++)
              i > 1 && i % 3 == 0
                  ? auction()
                  : SwipeTo(
                      leftSwipeWidget: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: SizeConfig.widthMultiplier * 5),
                        height: SizeConfig.widthMultiplier * 10,
                        width: SizeConfig.widthMultiplier * 10,
                        decoration: BoxDecoration(
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
                        child: Icon(
                          Icons.close,
                          size: 14,
                          color: theme.darkTextColor,
                        ),
                      ),
                      onLeftSwipe: () {
                        setState(() {
                          listOfChats.removeAt(i);
                        });
                      },
                      child: Container(
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
                        margin: EdgeInsets.only(
                            right: 15,
                            bottom: i == listOfChats.length - 1 ? 110 : 10,
                            left: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0; i < 2; i++)
                                          Container(
                                            height:
                                                SizeConfig.widthMultiplier * 5,
                                            width:
                                                SizeConfig.widthMultiplier * 5,
                                            margin: EdgeInsets.all(1),
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: const Offset(1, 1),
                                                    spreadRadius: 1,
                                                    color:
                                                        Colors.grey.shade300),
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage(
                                                          'assets/face_icons/male$i.jpg'))),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0; i < 2; i++)
                                          Container(
                                            height:
                                                SizeConfig.widthMultiplier * 5,
                                            width:
                                                SizeConfig.widthMultiplier * 5,
                                            margin: EdgeInsets.all(1),
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: const Offset(1, 1),
                                                    spreadRadius: 1,
                                                    color:
                                                        Colors.grey.shade300),
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage(
                                                          'assets/person.png'))),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'lucky_seven group public pro talk only',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.6),
                                      ),
                                      Text(
                                        'Thanks to all for joining this group.Hope you are all fine and enjoying.',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    2.8),
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                                width: SizeConfig.widthMultiplier * 16,
                                padding: EdgeInsets.only(
                                    top: SizeConfig.widthMultiplier * 4),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      '9:09 p.m.',
                                      style: TextStyle(
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 2.4),
                                    )))
                          ],
                        ),
                      ),
                    )
          ],
        ),
      ),
    );
  }

  Widget auction() {
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
      margin: EdgeInsets.only(right: 15, bottom: 10, left: 15),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 3, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lucky_seven auction',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                    Text(
                      'jeju island,california,lucky_seven auction',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Auction',
                  style: TextStyle(
                      color: Colors.red.shade800,
                      fontWeight: FontWeight.w700,
                      fontSize: SizeConfig.widthMultiplier * 3.6),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
