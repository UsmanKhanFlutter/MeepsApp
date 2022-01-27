import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/searchByRegionOrPackageName/search_by_region_or_package_name.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/searchByRegionOrPackageName/tourActivitySearchresult/tourOrActivitySearchResultDetails/tour_or_activity_search_result_details.dart';
import 'package:meeps/theme/colors.dart';

class TourOrActivitySearchResult extends StatefulWidget {
  @override
  _TourOrActivitySearchResultState createState() =>
      _TourOrActivitySearchResultState();
}

class _TourOrActivitySearchResultState
    extends State<TourOrActivitySearchResult> {
  TextEditingController searchText = TextEditingController();
  @override
  void initState() {
    searchText.text = 'Aquarium';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        intensity: 1,
                        shadowDarkColor: Colors.grey.shade400,
                        shadowLightColor: Colors.white,

                        // oppositeShadowLightSource: true,
                      ),
                      child: TextField(
                        controller: searchText,
                        onChanged: (value) {
                          setState(() {});
                        },
                        onTap: () {},
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: SizeConfig.widthMultiplier * 3.5,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          suffix: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.lightTextColor),
                              child: Icon(
                                Icons.close,
                                size: SizeConfig.widthMultiplier * 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(
                              minWidth: SizeConfig.widthMultiplier * 1),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.search,
                              size: SizeConfig.widthMultiplier * 5,
                              color: theme.lightTextColor,
                            ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('138 search results',
                            style: TextStyle(
                                fontSize: 12,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400)),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: theme.appBackgroundColor,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 3),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade300),
                              BoxShadow(
                                  offset: const Offset(-2, -2),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Colors.white70),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text('Price ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: theme.lightTextColor,
                                size: 14,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              searchResultsList(),
            ],
          ),
        ),
      ),
    ));
  } ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

  AppBar appBar(context, screenWidth) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: popNavigation(context, screenWidth),
      title: Text(
        'Tour/activity',
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

  Widget searchResultsList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              for (int i = 0; i < 8; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TourOrActivitySearchResultDetails()));
                  },
                  child: Container(
                    height: SizeConfig.widthMultiplier * 26,
                    width: double.infinity,
                    padding: EdgeInsets.all(SizeConfig.widthMultiplier * 1),
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: theme.appBackgroundColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.widthMultiplier * 3),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(3, 3),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.grey.shade300),
                        BoxShadow(
                            offset: const Offset(-2, -2),
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: Colors.white),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.widthMultiplier * 2.3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/wallpaper.jpg'))),
                        )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('[After 5pm]Night aquarium',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      3.7,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        height: SizeConfig.widthMultiplier * .5,
                                      ),
                                      Text('Smart Infany',
                                          style: TextStyle(
                                              color: theme.lightTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      2.7,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: theme.lightTextColor,
                                            size:
                                                SizeConfig.widthMultiplier * 3,
                                          ),
                                          Text(' 1.5 - 456 ratings',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontSize: SizeConfig
                                                          .widthMultiplier *
                                                      2.5,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      Text('383,484 won',
                                          style: TextStyle(
                                              color: theme.mainColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      3.6,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
}
