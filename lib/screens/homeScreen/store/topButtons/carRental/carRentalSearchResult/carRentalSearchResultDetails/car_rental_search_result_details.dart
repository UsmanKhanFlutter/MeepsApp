import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/searchByRegionOrPackageName/search_by_region_or_package_name.dart';
import 'package:meeps/theme/colors.dart';

class CarRentalSearchResultDetails extends StatefulWidget {
  @override
  _CarRentalSearchResultDetailsState createState() =>
      _CarRentalSearchResultDetailsState();
}

class _CarRentalSearchResultDetailsState
    extends State<CarRentalSearchResultDetails> {
  int selectedIndex = 0;
  int numberOfPerson = 0;
  List<String> iconsList = ['heart', 'save', 'write', 'share'];
  List<String> iconsNames = ['Like', 'Save car type', 'Write review', 'Share'];

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth),
      bottomNavigationBar: bottomBlock(screenWidth),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.widthMultiplier * 50,
                  width: double.infinity,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          height: SizeConfig.widthMultiplier * 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.widthMultiplier * 4.5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/car_image.png'))),
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 4; i++)
                    Neumorphic(
                      margin: EdgeInsets.all(5),
                      style: NeumorphicStyle(
                        depth: i == selectedIndex ? 1 : -1,
                        lightSource: LightSource.topLeft,
                        intensity: 1,
                        shadowDarkColor: Colors.grey.shade400,
                        shadowLightColor: Colors.white,

                        // oppositeShadowLightSource: true,
                      ),
                      child: Container(
                        color: theme.appBackgroundColor,
                        height: SizeConfig.widthMultiplier * 2.5,
                        width: SizeConfig.widthMultiplier * 2.5,
                      ),
                    )
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenWidth * 5,
                      ),
                      Text('Rainbow Mobility',
                          style: TextStyle(
                              fontSize: screenWidth * 3,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      Text('Grand Starex 12 Seater',
                          style: TextStyle(
                              fontSize: screenWidth * 5,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: screenWidth * 1.6,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                NeumorphicIcon(Icons.star,
                                    style: NeumorphicStyle(
                                      color: theme.mainColor,
                                      depth: 1,
                                      lightSource: LightSource.topLeft,
                                      intensity: 1,
                                      shadowDarkColor: Colors.grey.shade400,
                                      shadowLightColor: Colors.white,

                                      // oppositeShadowLightSource: true,
                                    ),
                                    size: screenWidth * 2.5)
                            ],
                          ),
                          Text(' View 203 reviews',
                              style: TextStyle(
                                  fontSize: screenWidth * 2.5,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: screenWidth * 4.7,
                                color: theme.lightTextColor,
                              ),
                              Text(
                                  ' 3-minute walk from Euljiro 1-ga Station Exit 7 ',
                                  style: TextStyle(
                                      fontSize: screenWidth * 3.2,
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('View map',
                                style: TextStyle(
                                    fontSize: screenWidth * 2.8,
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenWidth * 5,
                      ),
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -1,
                          lightSource: LightSource.top,

                          shadowDarkColor: Colors.grey.shade100,
                          shadowLightColor: Colors.white,

                          // oppositeShadowLightSource: true,
                        ),
                        child: Container(
                          color: theme.appBackgroundColor,
                          height: 4,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: screenWidth * 4),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < iconsList.length; i++)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/${iconsList[i]}.png',
                                    height: screenWidth * 5,
                                    width: screenWidth * 5,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(iconsNames[i],
                                      style: TextStyle(
                                          fontSize: screenWidth * 3.1,
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w400))
                                ],
                              )
                          ]),
                      SizedBox(height: screenWidth * 4),
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -1,
                          lightSource: LightSource.top,

                          shadowDarkColor: Colors.grey.shade100,
                          shadowLightColor: Colors.white,

                          // oppositeShadowLightSource: true,
                        ),
                        child: Container(
                          color: theme.appBackgroundColor,
                          height: 4,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: screenWidth * 6),
                      Row(
                        children: [
                          Image.asset(
                            'assets/valid_period.png',
                            height: screenWidth * 5,
                            width: screenWidth * 5,
                          ),
                          Text(
                              '   Free cancellation until 10am on December 1st',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      SizedBox(height: screenWidth * 3),
                      Row(
                        children: [
                          Image.asset(
                            'assets/key_icon.png',
                            height: screenWidth * 5,
                            width: screenWidth * 5,
                          ),
                          Text('   Mobile check-in',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      SizedBox(height: screenWidth * 3),
                      Row(
                        children: [
                          Image.asset(
                            'assets/car_seat_icon.png',
                            height: screenWidth * 5,
                            width: screenWidth * 5,
                          ),
                          Text('   Infant car seat rental - pay on site',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      SizedBox(height: screenWidth * 6),
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -1,
                          lightSource: LightSource.top,

                          shadowDarkColor: Colors.grey.shade100,
                          shadowLightColor: Colors.white,

                          // oppositeShadowLightSource: true,
                        ),
                        child: Container(
                          color: theme.appBackgroundColor,
                          height: 4,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: screenWidth * 2),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, screenWidth * 3, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            'assets/arrow_down_icon.png',
                            height: screenWidth * 5,
                            width: screenWidth * 5,
                          ),
                        ),
                      ),
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: screenWidth * 3),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Row(
                                  children: [
                                    Container(
                                        height: screenWidth * .9,
                                        width: screenWidth * .9,
                                        decoration: BoxDecoration(
                                            color: theme.lightTextColor,
                                            shape: BoxShape.circle)),
                                    Text(
                                        i == 0
                                            ? '   2015'
                                            : i == 1
                                                ? '   12 persons'
                                                : '   Navigation',
                                        style: TextStyle(
                                            fontSize: screenWidth * 3.4,
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Row(
                                  children: [
                                    Container(
                                        height: screenWidth * .9,
                                        width: screenWidth * .9,
                                        decoration: BoxDecoration(
                                            color: theme.lightTextColor,
                                            shape: BoxShape.circle)),
                                    Text(
                                        i == 0
                                            ? '   Diesel'
                                            : i == 1
                                                ? '   Automatic'
                                                : '   Bluetooth',
                                        style: TextStyle(
                                            fontSize: screenWidth * 3.4,
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: screenWidth * 3),
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -1,
                          lightSource: LightSource.top,

                          shadowDarkColor: Colors.grey.shade100,
                          shadowLightColor: Colors.white,

                          // oppositeShadowLightSource: true,
                        ),
                        child: Container(
                          color: theme.appBackgroundColor,
                          height: 4,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: screenWidth * 6),
                      shadowBlock1(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock2(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock3(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      rainbowMobility(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock4(screenWidth),
                      SizedBox(
                        height: 20,
                      ),
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -1,
                          lightSource: LightSource.top,

                          shadowDarkColor: Colors.grey.shade100,
                          shadowLightColor: Colors.white,

                          // oppositeShadowLightSource: true,
                        ),
                        child: Container(
                          color: theme.appBackgroundColor,
                          height: 4,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: screenWidth * 4),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: screenWidth * 7,
                            color: theme.lightTextColor,
                          ),
                          Text(' 4.9',
                              style: TextStyle(
                                  fontSize: screenWidth * 6.5,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w600)),
                          Text('  353 reviews',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.5,
                                  color: theme.lightTextColor?.withOpacity(.7),
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock5(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock6(screenWidth),
                    ],
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
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
                Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          size: SizeConfig.widthMultiplier * 3,
                                        ),
                                        Text(' 1.5 - 456 ratings',
                                            style: TextStyle(
                                                color: theme.lightTextColor,
                                                fontSize:
                                                    SizeConfig.widthMultiplier *
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
            ],
          ),
        ),
      ),
    );
  }

  Widget shadowBlock1(screenWidth) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
          boxShadow: AllShadows().boxShadow(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('12.01.2021(Wed) ~ 12.31.2021 (Fri) 24 nights',
                style: TextStyle(
                    fontSize: screenWidth * 3.3,
                    color: theme.lightTextColor,
                    fontWeight: FontWeight.w400)),
            Image.asset(
              'assets/arrow_down_icon.png',
              height: screenWidth * 5,
              width: screenWidth * 5,
            )
          ],
        ));
  }

  Widget shadowBlock2(screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenWidth * 1),
        Text('CDW+TPL',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 2),
        for (int i = 0; i < 3; i++)
          Padding(
            padding: EdgeInsets.only(bottom: screenWidth * 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 15,
                  child: Text(
                      i == 0
                          ? 'Condition'
                          : i == 1
                              ? 'Limit'
                              : 'Payment',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor?.withOpacity(.7),
                          fontWeight: FontWeight.w400)),
                ),
                Flexible(
                  child: Text(
                      i == 0
                          ? '26 years of age or older, more than 1 year of experience'
                          : i == 1
                              ? '\$200'
                              : '20% of the repair cost From \$100 to \$400. Tenant pays when limit is exceeded',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: Text('743,494 Won',
              style: TextStyle(
                  fontSize: screenWidth * 4,
                  color: theme.mainColor,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: screenWidth * 1),
      ]),
    );
  }

  Widget shadowBlock3(screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenWidth * 1),
        Text('CDW+TPL +',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 2),
        for (int i = 0; i < 3; i++)
          Padding(
            padding: EdgeInsets.only(bottom: screenWidth * 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 15,
                  child: Text(
                      i == 0
                          ? 'Condition'
                          : i == 1
                              ? 'Limit'
                              : 'Payment',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor?.withOpacity(.7),
                          fontWeight: FontWeight.w400)),
                ),
                Flexible(
                  child: Text(
                      i == 0
                          ? '26 years of age or older, more than 1 year of experience'
                          : i == 1
                              ? '\$200'
                              : 'none within limits\nTenant pays when limit is exceeded',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: Text('474,948 Won',
              style: TextStyle(
                  fontSize: screenWidth * 4,
                  color: theme.mainColor,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: screenWidth * 1),
      ]),
    );
  }

  Widget shadowBlock4(screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenWidth * 1),
        Text('Details',
            style: TextStyle(
                fontSize: screenWidth * 4,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 3),
        Text('Booking',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text(
            'Click the Book button, select a date and purchase, and your reservation will be confirmed. ',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 3),
        Text('Pick-up time',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text('10 a.m.',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 3),
        Text('Pick-up place',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text('Namsan Dulle-gil entrance road in front of the National Theater',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 5),
        Container(
          height: SizeConfig.widthMultiplier * 50,
          decoration: BoxDecoration(
              boxShadow: AllShadows().boxShadow(),
              borderRadius:
                  BorderRadius.circular(SizeConfig.widthMultiplier * 3),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/map2.png'))),
        ),
        SizedBox(height: screenWidth * 5),
        Text('Cancellation and Refund Policy',
            style: TextStyle(
                fontSize: screenWidth * 4,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text('Booking',
            style: TextStyle(
                fontSize: screenWidth * 3.8,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text(
            'Click the Book button, select a date and purchase, and your reservation will be confirmed.',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 1),
      ]),
    );
  }

  Widget shadowBlock5(screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenWidth * 1),
        Row(children: [
          Container(
            height: screenWidth * 12,
            width: screenWidth * 12,
            margin: EdgeInsets.only(bottom: 3),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                    spreadRadius: 1,
                    color: Colors.grey.shade400),
                const BoxShadow(
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                    spreadRadius: 2,
                    color: Colors.white70),
              ],
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/face_icons/male1.jpg'))),
            ),
          ),
          SizedBox(
            width: screenWidth * 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('park_jw',
                  style: TextStyle(
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 4.2)),
              SizedBox(
                height: screenWidth * .8,
              ),
              Text('20 reviews',
                  style: TextStyle(
                      color: theme.lightTextColor?.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 2.8)),
            ],
          )
        ]),
        SizedBox(height: screenWidth * 3),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              NeumorphicIcon(Icons.star,
                  style: NeumorphicStyle(
                    color: theme.mainColor,
                    depth: 1,
                    lightSource: LightSource.topLeft,
                    intensity: 1,
                    shadowDarkColor: Colors.grey.shade400,
                    shadowLightColor: Colors.white,

                    // oppositeShadowLightSource: true,
                  ),
                  size: screenWidth * 2.5)
          ],
        ),
        SizedBox(height: screenWidth * 1.5),
        Text(
            'We rented a car in good condition at a good price. Thanks to you, I had a great time with my family! :)',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 2),
        Text('Grand Starex 12 seater • 09-29-2021',
            style: TextStyle(
                fontSize: screenWidth * 2.6,
                color: theme.lightTextColor?.withOpacity(.7),
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 1),
      ]),
    );
  }

  Widget shadowBlock6(screenWidth) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3.5),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Text('View 203 reviews ',
          style: TextStyle(
              fontSize: screenWidth * 3.7,
              color: theme.lightTextColor?.withOpacity(.9),
              fontWeight: FontWeight.w500)),
    );
  }

  Widget bottomBlock(screenWidth) {
    return Container(
      height: screenWidth * 15,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Expanded(
            child: SizedBox(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5),
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
            child: Icon(
              Icons.favorite_outline,
              size: screenWidth * 6,
              color: theme.mainColor,
            ),
          ),
        )),
        Expanded(
            flex: 4,
            child: SizedBox(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: theme.mainColor,
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
                child: Text('Select an option',
                    style: TextStyle(
                        fontSize: screenWidth * 4,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              ),
            )),
      ]),
    );
  }

  Widget rainbowMobility(screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenWidth * 1),
        Text('Rainbow Mobility',
            style: TextStyle(
                fontSize: screenWidth * 4,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 2),
        Text(
            ' Rainbow Mobility has strong customer reviews.We work with the belief that vehicle management and service for customer satisfaction are the core. Enjoy a pleasant and safe trip to Jeju Island with Rainbow Mobility!',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 1),
      ]),
    );
  }
}
