import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class ExistingPostSlideUp extends StatefulWidget {
  @override
  _ExistingPostSlideUpState createState() => _ExistingPostSlideUpState();
}

class _ExistingPostSlideUpState extends State<ExistingPostSlideUp> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return !provData.showCostExistingPostSlideUp
        ? SizedBox()
        : Align(
            alignment: Alignment.bottomCenter,
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                provData.hideCostExistingPostSlideUpBLock();
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, screenWidth * 5, 0, 0),
                height: MediaQuery.of(context).size.height * .5,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AllShadows().boxShadow(),
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 8),
                      topRight: Radius.circular(screenWidth * 8)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: screenWidth * .5,
                            width: screenWidth * 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: theme.lightTextColor?.withOpacity(.6))),
                      ),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Padding(
                              padding: EdgeInsets.only(left: screenWidth * 10),
                              child: Text(
                                'Add to existing post',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 4.3),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                provData.hideCostExistingPostSlideUpBLock();
                              },
                              child: Container(
                                height: screenWidth * 10,
                                width: screenWidth * 10,
                                color: theme.appBackgroundColor,
                                padding: EdgeInsets.all(screenWidth * 2.5),
                                child: Image.asset(
                                  'assets/close_icon.png',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenWidth,
                      ),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      for (int i = 0; i < 10; i++)
                        existingPosts(i, screenWidth, provData)
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget existingPosts(i, screenWidth, StateSettingProvider provdata) {
    return GestureDetector(
      onTap: () {
        provdata.showCostExistingPostAlertBLock();
      },
      child: Container(
        height: SizeConfig.widthMultiplier * 15,
        width: double.infinity,
        decoration: BoxDecoration(
            color: theme.appBackgroundColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: AllShadows().boxShadow()),
        margin: EdgeInsets.only(
            right: screenWidth * 4,
            bottom: screenWidth * 3,
            left: screenWidth * 4),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: SizeConfig.widthMultiplier * 12,
                  width: SizeConfig.widthMultiplier * 12,
                  padding: EdgeInsets.all(screenWidth * .8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: AllShadows().boxShadow(),
                      borderRadius: BorderRadius.circular(screenWidth * 2.8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/river.png'))),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mid summer jeju island',
                        style: TextStyle(
                            color: theme.darkTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.widthMultiplier * 3.7),
                      ),
                      SizedBox(
                        height: screenWidth,
                      ),
                      Text(
                        '02.6.2021',
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
      ),
    );
  }
}
