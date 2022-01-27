import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class LuckySevenSlideUpDetails extends StatefulWidget {
  @override
  _LuckySevenSlideUpDetailsState createState() =>
      _LuckySevenSlideUpDetailsState();
}

class _LuckySevenSlideUpDetailsState extends State<LuckySevenSlideUpDetails> {
  List<String> personDetailsList = [
    '20 years old',
    'Male',
    'Total 1354 km',
    'Total 7 countries',
    'Totsl 41 cities',
    'Designer',
    'Art',
    'Fitness'
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return !provData.showLuckySevenSlidingUpDetails
        ? SizedBox()
        : Align(
            alignment: Alignment.bottomCenter,
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                provData.hideLuckySevenSlidingUpDetailsBLock();
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .56,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, screenWidth * 5, 0, 0),
                        height: MediaQuery.of(context).size.height * .5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(screenWidth * 8),
                              topRight: Radius.circular(screenWidth * 8)),
                          boxShadow:
                              AllShadows().boxShadow(darkSpreadRadius: 1),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      provData
                                          .hideLuckySevenSlidingUpDetailsBLock();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * 4),
                                      child: SizedBox(
                                          height: screenWidth * 6,
                                          width: screenWidth * 6,
                                          child: Image.asset(
                                              'assets/close_icon.png')),
                                    ),
                                  )),
                              SizedBox(
                                height: screenWidth * 7,
                              ),
                              Text('Lucky_seven',
                                  style: TextStyle(
                                      fontSize: screenWidth * 4.3,
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: screenWidth * 2,
                              ),
                              Text('Everyday travel,destination',
                                  style: TextStyle(
                                      fontSize: screenWidth * 3.2,
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: screenWidth * 6,
                              ),
                              personDetails(screenWidth),
                              SizedBox(
                                height: screenWidth * 5,
                              ),
                              buttons(screenWidth),
                              SizedBox(
                                height: screenWidth * 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: screenWidth * 24,
                        width: screenWidth * 24,
                        child: Stack(
                          children: [
                            Container(
                              height: screenWidth * 24,
                              width: screenWidth * 24,
                              margin: EdgeInsets.all(screenWidth),
                              padding: EdgeInsets.all(screenWidth * 1.2),
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
                                            "assets/face_icons/female3.jpg"))),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  height: screenWidth * 7,
                                  width: screenWidth * 7,
                                  margin: EdgeInsets.all(screenWidth),
                                  padding: EdgeInsets.all(screenWidth * 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset('assets/save.png')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget buttons(screenWidth) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Request for friend',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Send message',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget personDetails(screenWidth) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (int i = 0; i < personDetailsList.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: EdgeInsets.all(screenWidth * 2.2),
                  margin: EdgeInsets.only(
                      right: screenWidth * 3, bottom: screenWidth * 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 1.8),
                    color: theme.appBackgroundColor,
                    boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                  ),
                  child: Text(personDetailsList[i],
                      style: TextStyle(
                          color: theme.lightTextColor, fontSize: 12))),
            ],
          ),
      ],
    );
  }
}
