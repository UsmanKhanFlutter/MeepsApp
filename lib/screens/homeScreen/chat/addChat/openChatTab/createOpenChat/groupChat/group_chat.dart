import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/groupChat/strings.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/open_chat_tab.dart';
import 'package:meeps/theme/colors.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({Key? key}) : super(key: key);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  List<messageModel> allMessages = strings().listOfMessages;
  TextEditingController message = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          body: Stack(
            children: [
              ListView.builder(
                  itemCount: allMessages.length,
                  padding: EdgeInsets.only(
                      top: screenWidth * 30, bottom: screenWidth * 30),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: allMessages[index].isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        index.isEven
                            ? SizedBox()
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Monday,October 27',
                                      style: TextStyle(
                                          color: theme.lightTextColor!
                                              .withOpacity(.5),
                                          fontWeight: FontWeight.w400,
                                          fontSize: screenWidth * 3.1)),
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth * 4, 0,
                              screenWidth * 4, screenWidth * 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              allMessages[index].isMe
                                  ? SizedBox()
                                  : Container(
                                      height: screenWidth * 9,
                                      width: screenWidth * 9,
                                      margin: EdgeInsets.only(
                                          bottom: screenWidth * .5),
                                      padding: EdgeInsets.all(screenWidth * .6),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: AllShadows().boxShadow(),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                    'assets/face_icons/female3.jpg'))),
                                      ),
                                    ),
                              SizedBox(
                                width: screenWidth * 2,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: allMessages[index].isMe
                                        ? 0
                                        : screenWidth,
                                  ),
                                  allMessages[index].isMe
                                      ? SizedBox()
                                      : Text('Lucky_seven',
                                          style: TextStyle(
                                              color: theme.lightTextColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenWidth * 3.3)),
                                  SizedBox(
                                    height: screenWidth * 2,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      allMessages[index].isMe
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    '${allMessages[index].date} ',
                                                    style: TextStyle(
                                                        color: theme
                                                            .lightTextColor!
                                                            .withOpacity(.6),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            screenWidth * 2.7)),
                                                SizedBox(
                                                  width: screenWidth * 2,
                                                ),
                                              ],
                                            )
                                          : SizedBox(),
                                      Container(
                                        constraints: allMessages[index]
                                                    .description
                                                    .length >
                                                34
                                            ? BoxConstraints(
                                                maxWidth: screenWidth * 50)
                                            : BoxConstraints(),
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.all(screenWidth * 3),
                                        decoration: BoxDecoration(
                                            boxShadow: AllShadows().boxShadow(),
                                            color: theme.appBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    screenWidth * 3),
                                                topLeft: allMessages[index].isMe
                                                    ? Radius.circular(
                                                        screenWidth * 3)
                                                    : Radius.circular(0),
                                                bottomRight:
                                                    allMessages[index].isMe
                                                        ? Radius.circular(0)
                                                        : Radius.circular(
                                                            screenWidth * 3),
                                                bottomLeft: Radius.circular(
                                                    screenWidth * 3))),
                                        child: Text(
                                          allMessages[index].description,
                                          style: TextStyle(
                                              color: theme.lightTextColor,
                                              fontSize: screenWidth * 3.4),
                                        ),
                                      ),
                                      allMessages[index].isMe
                                          ? SizedBox()
                                          : Row(
                                              children: [
                                                SizedBox(
                                                  width: screenWidth * 2,
                                                ),
                                                Text(allMessages[index].date,
                                                    style: TextStyle(
                                                        color: theme
                                                            .lightTextColor!
                                                            .withOpacity(.6),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            screenWidth * 2.7)),
                                                Icon(
                                                  Icons.done,
                                                  color: theme.mainColor,
                                                  size: screenWidth * 3,
                                                ),
                                                Text('12',
                                                    style: TextStyle(
                                                        color: theme.mainColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            screenWidth * 2.7))
                                              ],
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [topBar(screenWidth)],
                ),
              ),
              sendMessageBlock(screenWidth)
            ],
          )),
    );
  }

  Widget topBar(screenWidth) {
    return Container(
        height: screenWidth * 20,
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 4),
        decoration: BoxDecoration(
            color: theme.appBackgroundColor,
            boxShadow: AllShadows().boxShadow(),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(screenWidth * 4),
                bottomRight: Radius.circular(screenWidth * 4))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/arrow_back.png',
                  width: screenWidth * 5,
                  height: screenWidth * 5,
                )),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 15,
                  height: screenWidth * 15,
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
                                padding: const EdgeInsets.all(1),
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < 2; i++)
                              Container(
                                height: SizeConfig.widthMultiplier * 5,
                                width: SizeConfig.widthMultiplier * 5,
                                margin: EdgeInsets.all(1),
                                padding: const EdgeInsets.all(1),
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
                                          image:
                                              AssetImage('assets/person.png'))),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Family group',
                        style: TextStyle(
                            color: theme.darkTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.widthMultiplier * 4),
                      ),
                      Text(
                        '30 people',
                        style: TextStyle(
                            color: theme.lightTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.widthMultiplier * 2.8),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/search_icon.png',
                      width: screenWidth * 5,
                      height: screenWidth * 5,
                    )),
                SizedBox(
                  width: screenWidth * 4,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/group_info_icon.png',
                      width: screenWidth * 5,
                      height: screenWidth * 5,
                    ))
              ],
            )
          ],
        ));
  }

  Widget sendMessageBlock(screenWidth) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                screenWidth * 4, 0, screenWidth * 4, screenWidth * 4),
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: screenWidth * 1.4, horizontal: screenWidth * 3),
            decoration: BoxDecoration(
              color: theme.appBackgroundColor,
              borderRadius: BorderRadius.circular(screenWidth * 3),
              boxShadow: AllShadows().boxShadow(),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Neumorphic(
                  style: AllShadows().neumorphicShadow(screenWidth, radius: 90),
                  child: Container(
                      height: screenWidth * 9,
                      width: screenWidth * 9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: theme.lightTextColor,
                        size: screenWidth * 5,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 2),
                    child: TextField(
                      controller: message,
                      maxLength: null,
                      maxLines: null,
                      style: TextStyle(
                          fontSize: screenWidth * 3.7,
                          fontWeight: FontWeight.w400,
                          color: theme.darkTextColor),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter message',
                          hintStyle: TextStyle(
                              fontSize: screenWidth * 3.7,
                              fontWeight: FontWeight.w400,
                              color: theme.lightTextColor!.withOpacity(.6))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      allMessages.add(messageModel(
                          name: 'Nino',
                          date: '12:34',
                          description: message.text,
                          isMe: true,
                          isSelected: false));
                      message.clear();
                    });
                  },
                  child: Container(
                      height: screenWidth * 9,
                      width: screenWidth * 9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: AllShadows().boxShadow()),
                      child: Icon(
                        Icons.send,
                        color: theme.lightTextColor,
                        size: screenWidth * 4.5,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
