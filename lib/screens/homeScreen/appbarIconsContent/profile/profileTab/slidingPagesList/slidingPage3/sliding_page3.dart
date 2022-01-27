import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/slidingPage3/bar_chart.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/slidingPage3/pie_chart.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class SlidingPage3 extends StatelessWidget {
  const SlidingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        traveExpenseStatisticsBlock(screenWidth),
        Container(width: double.infinity, child: PieChart()),
        Container(width: double.infinity, child: BarChart())
      ],
    );
  }

  Widget traveExpenseStatisticsBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 3,
        ),
        Text('Travel Expenses Statistics',
            style: TextStyle(
                fontSize: screenWidth * 4.1,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: screenWidth * 4,
        ),
        Column(
          children: [
            for (int i = 0; i < 4; i++)
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 4, bottom: screenWidth * 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Euro',
                          style: TextStyle(
                              fontSize: screenWidth * 3.4,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w400)),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text('2000',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                          Text('Euro',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            Container(
                margin: EdgeInsets.only(
                    right: screenWidth * 4, bottom: screenWidth * 4),
                height: 2,
                width: double.infinity,
                color: theme.lightTextColor!.withOpacity(.4)),
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 4, bottom: screenWidth * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Total',
                        style: TextStyle(
                            fontSize: screenWidth * 3.4,
                            color: theme.lightTextColor,
                            fontWeight: FontWeight.w400)),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text('2000',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400)),
                        Text('Dollars',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 4, bottom: screenWidth * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text('2,00,000',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400)),
                        Text('Won',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
