import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class SlidingPage2 extends StatelessWidget {
  const SlidingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: EdgeInsets.only(bottom: screenWidth * 13),
            child: day1Block(context, screenWidth, provData, i),
          )
      ],
    );
  }

  Widget day1Block(context, screenWidth, StateSettingProvider provData, i) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Day ${i + 1}',
                  style: TextStyle(
                      fontSize: screenWidth * 3.7,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w500)),
              Text('08.26.2021(Thur)',
                  style: TextStyle(
                      fontSize: screenWidth * 3.7,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
          margin: EdgeInsets.only(top: screenWidth * 2, right: screenWidth * 4),
          decoration: BoxDecoration(
            color: theme.appBackgroundColor,
            borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
            boxShadow: AllShadows().boxShadow(),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: screenWidth * 2),
            for (int i = 0; i < 3; i++)
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth * 2),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 15,
                          child: Text(
                              i == 0
                                  ? '10:00'
                                  : i == 1
                                      ? '14:30'
                                      : 'Finish',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.6,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Flexible(
                          child: Text(
                              i == 0
                                  ? 'Arrival and boarding at Gimpo Airport Airplane boarding and transfer'
                                  : i == 1
                                      ? 'Arrival in Jeju Island and a car renting Go for lunch'
                                      : 'Arrival and boarding at Gimpo Airport',
                              style: TextStyle(
                                  fontSize: screenWidth * 3,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    i == 1
                        ? InkWell(
                            onTap: () {
                              provData.showProfileTabSlidingPage2FilterBLock();
                            },
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 15),
                                Icon(Icons.location_on,
                                    size: screenWidth * 4,
                                    color: theme.mainColor),
                                Text('Eat mackerel with mother',
                                    style: TextStyle(
                                        fontSize: screenWidth * 3,
                                        color: theme.mainColor,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            SizedBox(height: screenWidth * 1),
          ]),
        ),
      ],
    );
  }
}
