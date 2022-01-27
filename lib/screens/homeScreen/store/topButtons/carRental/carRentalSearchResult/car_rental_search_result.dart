import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/carRental/carRentalSearchResult/carRentalFilter/car_rental_filter.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/carRental/carRentalSearchResult/carRentalSearchResultDetails/car_rental_search_result_details.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class CarRentalSearchResult extends StatefulWidget {
  const CarRentalSearchResult({Key? key}) : super(key: key);

  @override
  _CarRentalSearchResultState createState() => _CarRentalSearchResultState();
}

class _CarRentalSearchResultState extends State<CarRentalSearchResult> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 4, screenWidth * 4, screenWidth * 4, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 5,
                            vertical: screenWidth * 6),
                        decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: AllShadows().boxShadow(),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text('Seoul',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 4.5)),
                              SizedBox(width: screenWidth * 3.3),
                              Text('South Korea',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 3.3))
                            ]),
                            SizedBox(height: screenWidth * 2.5),
                            Text('12.01.2021(Wed) ~ 12.31.2021 (Fri)',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth * 3.3)),
                          ],
                        )),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('138 search results',
                            style: TextStyle(
                                fontSize: screenWidth * 2.8,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400)),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 2.6,
                                  vertical: screenWidth * 1.1),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: theme.appBackgroundColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 120),
                                boxShadow:
                                    AllShadows().boxShadow(darkSpreadRadius: 1),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Price ',
                                      style: TextStyle(
                                          fontSize: screenWidth * 2.8,
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w500)),
                                  Image.asset(
                                    'assets/expand.png',
                                    height: screenWidth * 1.8,
                                    width: screenWidth * 1.8,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth * 2),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  provData.showCarRentalFilter = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 2.6,
                                    vertical: screenWidth * 1.1),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 120),
                                  boxShadow: AllShadows()
                                      .boxShadow(darkSpreadRadius: 1),
                                ),
                                child: Text('  Filter  ',
                                    style: TextStyle(
                                        fontSize: screenWidth * 2.8,
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: screenWidth * 4),
                    for (int i = 0; i < 5; i++) carsDetailsList(screenWidth),
                    SizedBox(
                      height: screenWidth * 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          !provData.showCarRentalFilter ? SizedBox() : CarRentalFilter(),
          bottomNavigationBar()
        ],
      ),
    ));
  }
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

  AppBar appBar(context, screenWidth) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: popNavigation(context, screenWidth),
      title: Text(
        'Car rental',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Icon(
              Icons.more_horiz,
              color: theme.darkTextColor,
              size: screenWidth * 5,
            ))
      ],
    );
  }

  Widget carsDetailsList(screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CarRentalSearchResultDetails()));
      },
      child: Container(
          padding: EdgeInsets.all(screenWidth * 2),
          width: double.infinity,
          height: screenWidth * 60,
          margin: EdgeInsets.only(bottom: screenWidth * 3),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              color: theme.appBackgroundColor,
              borderRadius: BorderRadius.circular(screenWidth * 3),
              boxShadow: AllShadows().boxShadow()),
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 3),
                      boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/car_image.png'))),
                )),
            Expanded(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(),
                        Text('Grand Sterx 12 seater',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontSize: screenWidth * 3.7,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: screenWidth * 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4,
                                          vertical: screenWidth),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows()
                                            .boxShadow(darkSpreadRadius: 1),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 50),
                                      ),
                                      child: Text('Diesel',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.4)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4,
                                          vertical: screenWidth),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows()
                                            .boxShadow(darkSpreadRadius: 1),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 50),
                                      ),
                                      child: Text('2013-15',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.4)),
                                    ),
                                    SizedBox()
                                  ]),
                            ),
                            Expanded(
                              child: Center(
                                child: Text('General insurance\n. total',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: theme.lightTextColor,
                                        fontSize: screenWidth * 2.5,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text('383,484 won',
                                    style: TextStyle(
                                        color: theme.mainColor,
                                        fontSize: screenWidth * 3.6,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(),
                      ],
                    ))),
          ])),
    );
  }
}
