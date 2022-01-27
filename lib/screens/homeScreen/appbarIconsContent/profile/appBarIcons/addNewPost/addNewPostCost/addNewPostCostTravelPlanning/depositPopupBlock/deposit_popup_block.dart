import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/addCurrency/add_currency.dart';

import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class DepositPopupBlock extends StatefulWidget {
  @override
  State<DepositPopupBlock> createState() => _DepositPopupBlockState();
}

class _DepositPopupBlockState extends State<DepositPopupBlock> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: screenWidth * 80,
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 4, vertical: screenWidth * 4),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(screenWidth * 4),
                color: theme.appBackgroundColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: screenWidth * 4.5),
                    Text(
                      'Add deposit',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 3.9),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<StateSettingProvider>(context,
                                listen: false)
                            .hideCostDepositsPopupBlock();
                      },
                      child: Image.asset(
                        'assets/close_icon.png',
                        height: screenWidth * 4.5,
                        width: screenWidth * 4.5,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenWidth * 4,
                ),
                SizedBox(
                  height: screenWidth * 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 4; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                                listOfCurrencies[i]['selected'] = true;
                                listOfCurrencies.forEach((element) {
                                  if (element['name'] ==
                                      listOfCurrencies[i]['name']) {
                                  } else {
                                    element['selected'] = false;
                                  }
                                });
                              },
                              child: Container(
                                width: screenWidth * 13,
                                margin: EdgeInsets.symmetric(
                                    horizontal: screenWidth,
                                    vertical: screenWidth * 1.8),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth,
                                    horizontal: screenWidth),
                                decoration: BoxDecoration(
                                  boxShadow: AllShadows().boxShadow(),
                                  color: listOfCurrencies[i]['selected']
                                      ? theme.mainColor
                                      : theme.appBackgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 100),
                                ),
                                child: Text(
                                  listOfCurrencies[i]['name'],
                                  style: TextStyle(
                                      color: listOfCurrencies[i]['selected']
                                          ? Colors.white
                                          : theme.lightTextColor,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCurrency()));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth,
                              vertical: screenWidth * 1.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(screenWidth),
                          decoration: BoxDecoration(
                              boxShadow: AllShadows().boxShadow(),
                              color: theme.appBackgroundColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            size: screenWidth * 5,
                            color: theme.lightTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 1.5),
                Neumorphic(
                    style: AllShadows().neumorphicShadow(screenWidth),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: screenWidth * 3.6,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(maxWidth: 25),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.done,
                              size: screenWidth * 4,
                              color: theme.lightTextColor),
                        ),
                        filled: true,
                        fillColor: theme.simpleButtonColor,
                        border: InputBorder.none,
                        hintText: '100,000',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                SizedBox(height: screenWidth * 6),
                buttons(context, screenWidth)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  List<dynamic> listOfCurrencies = [
    {'name': 'Won', 'selected': true},
    {'name': 'Euro', 'selected': false},
    {'name': 'Pound', 'selected': false},
    {'name': 'Dollar', 'selected': false}
  ];
}

Widget buttons(context, screenWidth) {
  return Row(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            Provider.of<StateSettingProvider>(context, listen: false)
                .hideCostDepositsPopupBlock();
          },
          child: Container(
            height: screenWidth * 9,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
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
            Provider.of<StateSettingProvider>(context, listen: false)
                .hideCostDepositsPopupBlock();
          },
          child: Container(
            height: screenWidth * 9,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 70),
              color: theme.coloredButtonColor,
              boxShadow: AllShadows().boxShadow(),
            ),
            child: Text(
              'Done',
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
