import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/app_bar.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/carRental/carRentalSearchResult/car_rental_search_result.dart';
import 'package:meeps/theme/colors.dart';

class CarRental extends StatefulWidget {
  const CarRental({Key? key}) : super(key: key);

  @override
  _CarRentalState createState() => _CarRentalState();
}

class _CarRentalState extends State<CarRental> {
  bool drivingExperienced = true;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth, 'Car rental'),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.widthMultiplier * 4,
                    SizeConfig.widthMultiplier * 4,
                    SizeConfig.widthMultiplier * 4,
                    0),
                child: Column(
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        intensity: 1,
                        shadowDarkColor: Colors.grey.shade300,
                        shadowLightColor: Colors.white,

                        // oppositeShadowLightSource: true,
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.5,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/search_icon_colored.png',
                            width: screenWidth * 4,
                            height: screenWidth * 4,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: screenWidth * 10),
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: screenWidth * 3.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    Container(
                        height: screenWidth * 13,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 3.5),
                        decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: AllShadows().boxShadow(),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text('12.01.2021(Wed) ~ 12.31.2021 (Fri)',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 3.3))),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    Container(
                        height: screenWidth * 13,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 3.5),
                        decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: AllShadows().boxShadow(),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text('Driver\'s date of birth(YYMMDD)',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 3.3))),
                    SizedBox(
                      height: screenWidth * 3,
                    ),
                    Row(children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            drivingExperienced = !drivingExperienced;
                          });
                        },
                        child: Container(
                          height: screenWidth * 4.3,
                          width: screenWidth * 4.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: drivingExperienced
                                ? theme.mainColor
                                : theme.appBackgroundColor,
                            boxShadow: AllShadows().boxShadow(
                                darkSpreadRadius: 0,
                                lightSpreadRadius: 0,
                                darkBlurRadius: 2,
                                lightBlurRadius: 2),
                          ),
                          child: Icon(
                            Icons.done,
                            color: drivingExperienced
                                ? Colors.white
                                : theme.lightTextColor,
                            size: screenWidth * 3.3,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 1.5,
                      ),
                      Text('Driving experience for 1 year or more ',
                          style: TextStyle(
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 3)),
                    ]),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                          depth: 2,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey.shade200),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CarRentalSearchResult()));
                        },
                        child: Container(
                          height: screenWidth * 13,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.coloredButtonColor,
                            boxShadow: AllShadows().boxShadow(),
                          ),
                          child: Text(
                            'Car rental search',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: screenWidth * 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar()
        ],
      ),
    ));
  }
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

}
