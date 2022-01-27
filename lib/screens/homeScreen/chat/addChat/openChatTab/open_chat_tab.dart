import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/nameOfChat/create_open_chat_name.dart';
import 'package:meeps/theme/colors.dart';

class OpenChatTab extends StatefulWidget {
  const OpenChatTab({Key? key}) : super(key: key);

  @override
  _OpenChatTabState createState() => _OpenChatTabState();
}

class _OpenChatTabState extends State<OpenChatTab> {
  List<dynamic> typeList = [
    {'name': 'japan tour', 'selected': true},
    {'name': 'Tour for friendship', 'selected': false},
    {'name': 'With friends', 'selected': false},
    {'name': 'Domestic tour', 'selected': false},
    {'name': 'Jeju honeymoon', 'selected': false},
    {'name': 'One month in tongyeong', 'selected': false},
    {'name': 'One month in yeosu', 'selected': false},
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenWidth * 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateOpenChatName()));
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(screenWidth * 4, 0, screenWidth * 4, 0),
                alignment: Alignment.center,
                height: screenWidth * 13,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 1.4, horizontal: screenWidth * 3),
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(screenWidth * 3),
                  boxShadow: AllShadows().boxShadow(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Create open chat',
                        style: TextStyle(
                            fontSize: screenWidth * 3.7,
                            fontWeight: FontWeight.w500,
                            color: theme.lightTextColor!.withOpacity(.8))),
                    Neumorphic(
                      style: AllShadows()
                          .neumorphicShadow(screenWidth, radius: 90),
                      child: Container(
                          height: screenWidth * 7,
                          width: screenWidth * 7,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: theme.appBackgroundColor,
                          ),
                          child: Icon(
                            Icons.add,
                            color: theme.mainColor,
                            size: screenWidth * 4,
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 4,
            ),
            names(screenWidth),
            SizedBox(
              height: screenWidth * 4,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(screenWidth * 4, 0, screenWidth * 4, 0),
              child: Row(
                children: [
                  Text('#Domestic tour ',
                      style: TextStyle(
                          fontSize: screenWidth * 4.6,
                          fontWeight: FontWeight.w600,
                          color: theme.mainColor)),
                  Text(' Open chat',
                      style: TextStyle(
                          fontSize: screenWidth * 4.6,
                          fontWeight: FontWeight.w600,
                          color: theme.lightTextColor!.withOpacity(.8)))
                ],
              ),
            ),
            SizedBox(
              height: screenWidth * 4,
            ),
            for (int i = 0; i < 8; i++) groupsList(screenWidth),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  Widget names(screenWidth) {
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 4, 0, screenWidth * 4, 0),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          for (int i = 0; i < typeList.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      typeList[i]['selected'] = true;
                      typeList.forEach((element) {
                        if (element['name'] == typeList[i]['name']) {
                        } else {
                          element['selected'] = false;
                        }
                      });
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(screenWidth * 2.2),
                      margin: EdgeInsets.only(
                          right: screenWidth * 3, bottom: screenWidth * 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 1.8),
                        color: typeList[i]['selected']
                            ? theme.mainColor
                            : theme.appBackgroundColor,
                        boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(typeList[i]['name'],
                              style: TextStyle(
                                  color: typeList[i]['selected']
                                      ? Colors.white
                                      : theme.lightTextColor,
                                  fontSize: 12)),
                        ],
                      )),
                ),
              ],
            ),
        ],
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
                    Text(
                      'Sharing domestic travel tips',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.widthMultiplier * 3.6),
                    ),
                    Text(
                      'Group chat | 108/unlimited',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
