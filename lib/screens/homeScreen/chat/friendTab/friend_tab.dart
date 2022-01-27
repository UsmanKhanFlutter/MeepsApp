import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/theme/colors.dart';
import 'package:swipe_to/swipe_to.dart';

class FriendTab extends StatefulWidget {
  @override
  State<FriendTab> createState() => _FriendTabState();
}

class _FriendTabState extends State<FriendTab> {
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
                                            image: AssetImage(
                                                'assets/face_icons/male$i.jpg'))),
                                  ),
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
                                        'lucky_seven',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.6),
                                      ),
                                      Text(
                                        'jeju island,california',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    2.8),
                                      )
                                    ],
                                  ),
                                ))
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
