import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/hashtagOfChat/create_open_chat_hashtag.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class CreateOpenChatName extends StatefulWidget {
  @override
  State<CreateOpenChatName> createState() => _CreateOpenChatNameState();
}

class _CreateOpenChatNameState extends State<CreateOpenChatName> {
  TextEditingController groupName = TextEditingController();

  @override
  void dispose() {
    groupName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Add chat', screenWidth),
        body: Container(
          padding: EdgeInsets.all(screenWidth * 4),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 6),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(),
                      borderRadius: BorderRadius.circular(screenWidth * 3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenWidth * 3),
                        Text(
                          'Enter name of chat',
                          style: TextStyle(
                              color: theme.mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 4.3),
                        ),
                        SizedBox(height: screenWidth * 10),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 2),
                              boxShadow: AllShadows().boxShadow()),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            maxLength: 30,
                            textAlign: TextAlign.center,
                            controller: groupName,
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: screenWidth * 3.6,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'Enter group name',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: screenWidth * 3.6,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, screenWidth * 3, screenWidth * 4, 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${groupName.text.length}/30',
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontSize: screenWidth * 3,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth),
                child: Neumorphic(
                  style: AllShadows().neumorphicShadow(screenWidth,
                      depth: groupName.text.isNotEmpty ? 2 : -2),
                  child: GestureDetector(
                    onTap: () {
                      if (groupName.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateOpenChatHashtag()));
                      }
                    },
                    child: Container(
                      height: screenWidth * 13,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: groupName.text.isNotEmpty
                            ? theme.mainColor
                            : theme.simpleButtonColor,
                      ),
                      child: Text(
                        groupName.text.isNotEmpty ? 'Next' : 'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: groupName.text.isNotEmpty
                                ? Colors.white
                                : theme.lightTextColor,
                            fontSize: screenWidth * 3.8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////Widgets//////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

}
