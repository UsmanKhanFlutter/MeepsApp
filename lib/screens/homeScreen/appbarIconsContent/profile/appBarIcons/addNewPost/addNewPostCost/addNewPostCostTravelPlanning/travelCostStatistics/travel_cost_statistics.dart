import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/charts/bar_chart.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/charts/pie_chart.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class TravelCostStatistics extends StatefulWidget {
  const TravelCostStatistics({Key? key}) : super(key: key);

  @override
  _TravelCostStatisticsState createState() => _TravelCostStatisticsState();
}

class _TravelCostStatisticsState extends State<TravelCostStatistics> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        travelCostStatisticsBlock(screenWidth),
        SizedBox(
          height: screenWidth * 10,
        ),
        provData.isCostExpensesDone
            ? Column(
                children: [PieChart(), BarChart()],
              )
            : circleTotalExpenses(screenWidth)
      ],
    );
  }

  Widget travelCostStatisticsBlock(screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenWidth * 3,
          ),
          Text('Travel Cost Statistics',
              style: TextStyle(
                  fontSize: screenWidth * 4.1,
                  color: theme.lightTextColor,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: screenWidth * 4,
          ),
          Column(
            children: [
              for (int i = 0; i < travelCostStatisticsList.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth * 4, bottom: screenWidth * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(travelCostStatisticsList[i]['currencyName'],
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400)),
                      ),
                      Container(
                        width: screenWidth * 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    travelCostStatisticsList[i]['amount']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: screenWidth * 3.4,
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    travelCostStatisticsList[i]['currency'],
                                    style: TextStyle(
                                        fontSize: screenWidth * 3.4,
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w400)),
                              ),
                            )
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
                      Container(
                        width: screenWidth * 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('0',
                                    style: TextStyle(
                                        fontSize: screenWidth * 3.4,
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Won',
                                    style: TextStyle(
                                        fontSize: screenWidth * 3.4,
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w400)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget circleTotalExpenses(screenWidth) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: screenWidth * 70,
        width: screenWidth * 70,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.appBackgroundColor,
            boxShadow: AllShadows().boxShadow()),
        child: Container(
          alignment: Alignment.center,
          height: screenWidth * 62,
          width: screenWidth * 62,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.appBackgroundColor,
              boxShadow: AllShadows().boxShadow()),
          child: Neumorphic(
            style: AllShadows().neumorphicShadow(screenWidth,
                radius: screenWidth * 200, depth: -4),
            child: Container(
              alignment: Alignment.center,
              height: screenWidth * 43,
              width: screenWidth * 43,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.appBackgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('1,532,590 Won',
                      style: TextStyle(
                          fontSize: screenWidth * 5,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500)),
                  Text('1000 Dollars',
                      style: TextStyle(
                          fontSize: screenWidth * 3.7,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: screenWidth * 3),
                  Text('Total expenditure',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<dynamic> travelCostStatisticsList = [
    {'currencyName': 'Euro', 'amount': 0, 'currency': 'Euros'},
    {'currencyName': 'British Pound', 'amount': 10, 'currency': 'Pounds'},
    {'currencyName': 'US Dollar', 'amount': 120, 'currency': 'Dollars'},
    {'currencyName': 'Korean Won', 'amount': 0, 'currency': 'Won'}
  ];
}
