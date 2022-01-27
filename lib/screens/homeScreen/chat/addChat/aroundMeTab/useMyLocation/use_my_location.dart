import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/nameOfChat/create_open_chat_name.dart';
import 'package:meeps/theme/colors.dart';

class UseMyLocation extends StatefulWidget {
  const UseMyLocation({Key? key}) : super(key: key);

  @override
  _UseMyLocationState createState() => _UseMyLocationState();
}

class _UseMyLocationState extends State<UseMyLocation> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 4),
                  child: Text('Search around me',
                      style: TextStyle(
                          fontSize: screenWidth * 4.5,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                    margin: EdgeInsets.only(right: screenWidth * 4),
                    height: screenWidth * 8,
                    width: screenWidth * 8,
                    padding: EdgeInsets.all(screenWidth * 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: AllShadows().boxShadow()),
                    child: Image.asset(
                      'assets/settings_icon.png',
                      color: theme.lightTextColor,
                    ))
              ],
            ),
            SizedBox(
              height: screenWidth * 4,
            ),
            for (int i = 0; i < 8; i++)
              i == 3 || i == 5
                  ? groupsList(screenWidth)
                  : singleChat(screenWidth),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  Widget groupsList(screenWidth) {
    return Container(
      padding: EdgeInsets.only(right: screenWidth * 2),
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(screenWidth * 3),
        boxShadow: AllShadows().boxShadow(),
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/roomm.jpg'))
      ),
      margin: EdgeInsets.fromLTRB(
          screenWidth * 4, 0, screenWidth * 4, screenWidth * 3),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        Container(
                          height: SizeConfig.widthMultiplier * 5,
                          width: SizeConfig.widthMultiplier * 5,
                          margin: EdgeInsets.all(1),
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        Container(
                          height: SizeConfig.widthMultiplier * 5,
                          width: SizeConfig.widthMultiplier * 5,
                          margin: EdgeInsets.all(1),
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
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage('assets/person.png'))),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sharing domestic travel group',
                          style: TextStyle(
                              color: theme.darkTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 3.6),
                        ),
                        SizedBox(
                          width: screenWidth * 1.5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth,
                              vertical: screenWidth * .6),
                          decoration: BoxDecoration(
                              color: theme.lightTextColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 20)),
                          child: Text(
                            '40m',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 2.1),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Group chat',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 3)),
                        Text(' | ',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 4)),
                        SizedBox(
                          height: screenWidth * 3,
                          width: screenWidth * 3,
                          child: Image.asset('assets/person_icon.png',
                              color: theme.lightTextColor),
                        ),
                        Text('  108/unlimited',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 3))
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget singleChat(screenWidth) {
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
                          image: AssetImage('assets/face_icons/male4.jpg'))),
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
                    Row(
                      children: [
                        Text(
                          'lucky_seven',
                          style: TextStyle(
                              color: theme.darkTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 3.6),
                        ),
                        SizedBox(
                          width: screenWidth * 1.5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 1.1,
                              vertical: screenWidth * .6),
                          decoration: BoxDecoration(
                              color: theme.lightTextColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 20)),
                          child: Text(
                            '40m',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 2.1),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 1.5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 1.1,
                              vertical: screenWidth * .6),
                          decoration: BoxDecoration(
                              color: theme.mainColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 20)),
                          child: Text(
                            'Friend',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 2.1),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'jeju island,california',
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
}
