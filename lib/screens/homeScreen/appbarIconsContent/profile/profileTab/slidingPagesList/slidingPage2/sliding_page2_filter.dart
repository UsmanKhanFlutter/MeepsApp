import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SlidingPage2Filter extends StatefulWidget {
  @override
  _SlidingPage2FilterState createState() => _SlidingPage2FilterState();
}

class _SlidingPage2FilterState extends State<SlidingPage2Filter> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return !provData.showProfileTabSlidingPage2Filter
        ? SizedBox()
        : Align(
            alignment: Alignment.bottomCenter,
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                provData.hideProfileTabSlidingPage2FilterBLock();
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, screenWidth * 5, 0, 0),
                height: MediaQuery.of(context).size.height * .6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 8),
                      topRight: Radius.circular(screenWidth * 8)),
                  boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                                height: screenWidth * .5,
                                width: screenWidth * 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:
                                        theme.lightTextColor?.withOpacity(.6))),
                            SizedBox(
                              height: screenWidth * 2,
                            ),
                            Text('Get direction',
                                style: TextStyle(
                                    fontSize: screenWidth * 4.3,
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 7,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 4),
                        child: SizedBox(
                          width: double.infinity,
                          height: screenWidth * 30,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, screenWidth, 0, 0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: screenWidth * 4),
                                          child: Text('Departure',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: screenWidth * 3.3)),
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: screenWidth * 11,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth * 3.5),
                                              decoration: BoxDecoration(
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow:
                                                    AllShadows().boxShadow(),
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('My current location',
                                                  style: TextStyle(
                                                      color:
                                                          theme.lightTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          screenWidth * 3.3))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, screenWidth * 2.4, 0, 0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: screenWidth * 4),
                                          child: Text('Arrival      ',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: screenWidth * 3.3)),
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: screenWidth * 11,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth * 3.5),
                                              decoration: BoxDecoration(
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow:
                                                    AllShadows().boxShadow(),
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Eat mackerel with Mom',
                                                  style: TextStyle(
                                                      color: theme.mainColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          screenWidth * 3.3))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: SizeConfig.widthMultiplier * 9,
                                  width: SizeConfig.widthMultiplier * 9,
                                  margin:
                                      EdgeInsets.only(right: screenWidth * 3),
                                  decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: AllShadows().boxShadow(),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/double_arrow_top_down.png',
                                    width: SizeConfig.widthMultiplier * 4,
                                    height: SizeConfig.widthMultiplier * 4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      for (int i = 0; i < 3; i++)
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 3.5,
                                vertical: screenWidth * 2),
                            margin: EdgeInsets.only(
                                bottom: screenWidth * 5,
                                left: screenWidth * 4,
                                right: screenWidth * 4),
                            decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: AllShadows().boxShadow(),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenWidth,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Public transportation',
                                            style: TextStyle(
                                                color: theme.lightTextColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: screenWidth * 3.6)),
                                        SizedBox(
                                          width: screenWidth * 2,
                                        ),
                                        Text('Recommendation',
                                            style: TextStyle(
                                                color: theme.lightTextColor!
                                                    .withOpacity(.8),
                                                fontWeight: FontWeight.w400,
                                                fontSize: screenWidth * 2.6))
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenWidth * 4,
                                      width: screenWidth * 4,
                                      child: Image.asset(
                                          'assets/heart_colored.png'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenWidth * 4,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: screenWidth * 5,
                                      width: screenWidth * 5,
                                      child: Image.asset('assets/bus_icon.png'),
                                    ),
                                    Container(
                                      height: screenWidth * .5,
                                      width: screenWidth * 4,
                                      color: theme.mainColor,
                                      margin: EdgeInsets.only(
                                          left: screenWidth * .6,
                                          right: screenWidth * .1),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 5,
                                      width: screenWidth * 5,
                                      child:
                                          Image.asset('assets/steps_icon.png'),
                                    ),
                                    Container(
                                      height: screenWidth * .5,
                                      width: screenWidth * 8,
                                      color: theme.mainColor,
                                      margin: EdgeInsets.only(
                                          left: screenWidth * .1,
                                          right: screenWidth * .5),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 4.5,
                                      width: screenWidth * 4.5,
                                      child: Image.asset(
                                        'assets/valid_period.png',
                                        color: theme.mainColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenWidth * 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Bus 1 minute + Walk 12 minutes',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: screenWidth * 3)),
                                    Text('1200 Won',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: screenWidth * 3)),
                                  ],
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                              ],
                            )),
                      SizedBox(
                        height: screenWidth * 7,
                      ),
                      buttons(screenWidth, provData),
                      SizedBox(
                        height: screenWidth * 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget buttons(screenWidth, StateSettingProvider provData) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              provData.hideProfileTabSlidingPage2FilterBLock();

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
                'Cancel',
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
                'Load more',
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
}
