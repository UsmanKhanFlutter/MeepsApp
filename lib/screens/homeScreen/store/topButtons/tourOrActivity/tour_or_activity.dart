import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/app_bar.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/searchByRegionOrPackageName/search_by_region_or_package_name.dart';
import 'package:meeps/theme/colors.dart';

class TourOrActivity extends StatefulWidget {
  @override
  _TourOrActivityState createState() => _TourOrActivityState();
}

class _TourOrActivityState extends State<TourOrActivity> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth, 'Tour/activity'),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        readOnly: true,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  SearchByRegionOrPackageName()));
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: SizeConfig.widthMultiplier * 3.5,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/search_icon_colored.png',
                            width: SizeConfig.widthMultiplier * 4,
                            height: SizeConfig.widthMultiplier * 4,
                          ),
                          prefixIconConstraints: BoxConstraints(
                              minWidth: SizeConfig.widthMultiplier * 10),
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Search by region or package name',
                          hintStyle: TextStyle(
                              color: theme.lightTextColor,
                              fontSize: SizeConfig.widthMultiplier * 3.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.widthMultiplier * 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 3),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: Colors.grey.shade400),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black26, BlendMode.darken),
                              image: AssetImage('assets/aquarium.png'))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('COEX Aquarium',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ptSans(
                                  fontSize: SizeConfig.widthMultiplier * 7.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Text('Meeps Exclusive Deals',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ptSans(
                                  fontSize: SizeConfig.widthMultiplier * 4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Popular destination',
                        style: TextStyle(
                            fontSize: 19,
                            color: theme.lightTextColor,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 2),
                    Text('From local walking tours to bus tours!',
                        style: TextStyle(
                            fontSize: 13,
                            color: theme.lightTextColor,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 10),
                    SizedBox(
                      height: SizeConfig.widthMultiplier * 90,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.1),
                          itemBuilder: (context, index) {
                            return popularDestination();
                          }),
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

  Widget popularDestination() {
    return Container(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
        width: SizeConfig.widthMultiplier * 40,
        margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.grey.shade300),
            BoxShadow(
                offset: const Offset(-3, -3),
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.white70),
          ],
        ),
        child: Column(children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(3, 3),
                          blurRadius: 6,
                          spreadRadius: 1,
                          color: Colors.grey.shade400),
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/river.png'))),
              )),
          Expanded(
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Text('Travelling around UK with a professional guide',
                          style: TextStyle(
                              color: theme.lightTextColor,
                              fontSize: SizeConfig.widthMultiplier * 3,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: SizeConfig.widthMultiplier * 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('lucky7+4k',
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontSize: SizeConfig.widthMultiplier * 2.3,
                                  fontWeight: FontWeight.w400)),
                          Text('383,484 won',
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontSize: SizeConfig.widthMultiplier * 2.8,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(),
                    ],
                  ))),
        ]));
  }
}
