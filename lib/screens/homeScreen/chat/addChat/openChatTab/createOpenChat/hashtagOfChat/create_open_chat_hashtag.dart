import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/filtersOfChat/create_open_chat_filters.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class CreateOpenChatHashtag extends StatefulWidget {
  @override
  State<CreateOpenChatHashtag> createState() => _CreateOpenChatHashtagState();
}

class _CreateOpenChatHashtagState extends State<CreateOpenChatHashtag> {
  TextEditingController hashtag = TextEditingController();

  @override
  void dispose() {
    hashtag.dispose();
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
                          'Introduce a chat using #tag',
                          style: TextStyle(
                              color: theme.mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 4.3),
                        ),
                        SizedBox(height: screenWidth * 10),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 2),
                              boxShadow: AllShadows().boxShadow()),
                          child: TextField(
                            maxLines: null,
                            onChanged: (value) {
                              setState(() {});
                            },
                            maxLength: 80,
                            textAlign: TextAlign.center,
                            controller: hashtag,
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: screenWidth * 3.6,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'Enter #tag',
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
                              '${hashtag.text.length}/80',
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
                      depth: hashtag.text.isNotEmpty ? 2 : -2),
                  child: GestureDetector(
                    onTap: () {
                      if (hashtag.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateOpenChatFilters()));
                      }
                    },
                    child: Container(
                      height: screenWidth * 13,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: hashtag.text.isNotEmpty
                            ? theme.mainColor
                            : theme.simpleButtonColor,
                      ),
                      child: Text(
                        hashtag.text.isNotEmpty ? 'Next' : 'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: hashtag.text.isNotEmpty
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
