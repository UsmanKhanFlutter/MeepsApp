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

class TourOrActivitySearchResultDetails extends StatefulWidget {
  @override
  _TourOrActivitySearchResultDetailsState createState() =>
      _TourOrActivitySearchResultDetailsState();
}

class _TourOrActivitySearchResultDetailsState
    extends State<TourOrActivitySearchResultDetails> {
  int selectedIndex = 0;
  int numberOfPerson = 0;
  List<String> iconsList = ['heart', 'save', 'write', 'share'];
  List<String> iconsNames = ['Like', 'Save itinery', 'Write review', 'Share'];

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
                                  image: AssetImage('assets/aquarium.png'))),
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
                      Text('South Korea > Seoul',
                          style: TextStyle(
                              fontSize: screenWidth * 3,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      Text('[After 5pm]Nighttime Aquarium',
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
                        children: [
                          Icon(
                            Icons.location_on,
                            size: screenWidth * 4.7,
                            color: theme.lightTextColor,
                          ),
                          Text(
                              ' VLotte World Mall B1, 300 Olympic-ro, Songpa-gu, Seoul',
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
                      ),
                      SizedBox(
                        height: 5,
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
                      SizedBox(height: screenWidth * 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/ticket.png',
                            height: screenWidth * 5,
                            width: screenWidth * 5,
                          ),
                          Text('   e-ticket',
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
                            'assets/valid_period.png',
                            height: screenWidth * 5,
                            width: screenWidth * 5,
                          ),
                          Text(
                              '   Use within the validity period (~12.31.2021)',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
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
                      SizedBox(height: screenWidth * 4),
                      shadowBlock1(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock2(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock3(screenWidth),
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
                      shadowBlock4(screenWidth),
                      SizedBox(height: screenWidth * 4),
                      shadowBlock5(screenWidth),
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenWidth * 1),
        Text('[After 5pm]Nighttime Aquarium',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text('VLotte World Mall B1, 300 Olympic-ro, Songpa-gu, Seoul',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (numberOfPerson == 0) {
                      return;
                    } else {
                      numberOfPerson = numberOfPerson - 1;
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenWidth * 7,
                  width: screenWidth * 7,
                  decoration: BoxDecoration(
                    color: theme.appBackgroundColor,
                    shape: BoxShape.circle,
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
                    Icons.remove,
                    size: screenWidth * 4,
                    color: theme.lightTextColor,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 3),
              Text(numberOfPerson.toString(),
                  style: TextStyle(
                      fontSize: screenWidth * 4.5,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: screenWidth * 3),
              GestureDetector(
                onTap: () {
                  setState(() {
                    numberOfPerson = numberOfPerson + 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenWidth * 7,
                  width: screenWidth * 7,
                  decoration: BoxDecoration(
                    color: theme.appBackgroundColor,
                    shape: BoxShape.circle,
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
                    Icons.add,
                    size: screenWidth * 4,
                    color: theme.mainColor,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text('1 person ',
                  style: TextStyle(
                      color: theme.lightTextColor,
                      fontSize: SizeConfig.widthMultiplier * 2.4,
                      fontWeight: FontWeight.w500)),
              Text(' 383,484 won',
                  style: TextStyle(
                      color: theme.mainColor,
                      fontSize: SizeConfig.widthMultiplier * 3.4,
                      fontWeight: FontWeight.w700)),
            ],
          )
        ]),
        SizedBox(height: screenWidth * 1),
      ]),
    );
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
        Text('Starry night,aquarium',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text(
            'Night Aquarium, which adjusts the tank brightness to the habitat\'s night environment over time after sunset! You can see the appearance and activities of various marine life at night. Visit the aquarium that is close to nature!',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 5),
        Container(
          height: SizeConfig.widthMultiplier * 50,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.widthMultiplier * 3),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/aquarium.png'))),
        ),
        SizedBox(height: screenWidth * 4),
        Text('Please check before purchase!',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 3),
        for (int i = 0; i < 4; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: screenWidth * 1),
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: theme.lightTextColor),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  child: Text(
                      'This product is a gift certificate for one person to large and to small as well.',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400)))
            ]),
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
            'Click the book button, select a date and purchase, and your reservation will be confirmed. It can be used after confirming the ticket through KakaoTalk or text message.',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 3),
        Text('Admission',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text('Admission time: Available from 17:00',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 3),
        Text('Location',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text('Lotte World Mall B1, 300 Olympic-ro, Songpa-gu,Seoul',
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
                  fit: BoxFit.cover, image: AssetImage('assets/map.png'))),
        ),
        SizedBox(height: screenWidth * 5),
        Text('Cancellation Policy',
            style: TextStyle(
                fontSize: screenWidth * 3.9,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(height: screenWidth * 1.5),
        Text(
            '100% refund for unused tickets within the valid period\nNo cancellation/refund of used ticket',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
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
                      image: AssetImage('assets/person.png'))),
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
        Text('It was so much fun! I was for a good price :)',
            style: TextStyle(
                fontSize: screenWidth * 3,
                color: theme.lightTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 2),
        Text('[After 5pm] Night Aquarium • 09-29-2021',
            style: TextStyle(
                fontSize: screenWidth * 2.6,
                color: theme.lightTextColor?.withOpacity(.7),
                fontWeight: FontWeight.w400)),
        SizedBox(height: screenWidth * 1),
      ]),
    );
  }

  Widget shadowBlock5(screenWidth) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3.5),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
        boxShadow: AllShadows().boxShadow(),
      ),
      child: Text('View all 203 reviews ',
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
}
