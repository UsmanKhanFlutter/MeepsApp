import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/ListWidgets/popularTravelPlacesOfWeek/popular_travel_places_of_week.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/meeps_tv_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class Youtube extends StatefulWidget {
  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  bool onlineTourSelected = true;
  bool tourAndActivitySelected = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  meepsBanner(context),
                  SizedBox(height: 30),
                  Text('Meeps TV',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  meepsTV(context),
                  SizedBox(height: 30),
                  Text('Where Shall We Go?',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  citiesList(screenWidth, context),
                  SizedBox(height: 30),
                  Text('Popular Travel Place This Week',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  popularTravelPlacesOfWeek(context, screenWidth),
                  SizedBox(height: 30),
                  Text('Tourists attractions around me',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  touristsAttractionsAroundMe(),
                  SizedBox(height: 30),
                  onlineOrActivityTour(),
                  SizedBox(height: 30),
                  onlineOrActivityTourList()
                ],
              ),
            ),
            SizedBox(height: 120)
          ],
        ),
      ),
    );
  }

  Widget meepsBanner(_) {
    final meepsTvProvider = Provider.of<MeepsTvProvider>(_);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('admin_youtube_banners')
            .snapshots(),
        builder: (context, snapshot) {
          // print(snapshot.data?.docs[0].get('thumbnail'));
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              height: SizeConfig.widthMultiplier * 50,
              margin: EdgeInsets.only(right: 15),
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
                      colorFilter:
                          ColorFilter.mode(Colors.black26, BlendMode.darken),
                      image: NetworkImage(snapshot.data?.docs[0]
                              .get('thumbnail') ??
                          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
              child: Text(
                  snapshot.data?.docs[0].get('title') ??
                      'The moment we want to be together.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                      fontSize: SizeConfig.widthMultiplier * 7.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            );
          }
        });
  }

  Widget meepsTV(_) {
    final meepsTvProvider = Provider.of<MeepsTvProvider>(_);
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('admin_meeps_tv').snapshots(),
        builder: (context, snapshot) {
          //print(snapshot.data?.docs[0].get('date'));
          // final abc = snapshot.data?.docs.map((_doc) => _doc);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: 170,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: snapshot.data?.size,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(13),
                      width: MediaQuery.of(context).size.width / 1.3,
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 3),
                                blurRadius: 6,
                                spreadRadius: 3,
                                color: Colors.grey.shade200),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data?.docs[index]
                                      .get('thumbnail') ??
                                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                      child: Row(
                        children: [
                          Container(
                            height: 26,
                            width: 26,
                            margin: EdgeInsets.only(bottom: 3),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    offset: const Offset(1, 1),
                                    spreadRadius: 1,
                                    color: Colors.grey.shade500),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(snapshot
                                              .data?.docs[index]
                                              .get('thumbnail') ??
                                          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('123 lucky Seven',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    );
                  }),
            );
          }
        });
  }

  Widget citiesList(screenWidth, _) {
    final meepsTvProvider = Provider.of<MeepsTvProvider>(_);
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('admin_cities').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //print(snapshot.data?.docs[0].get('date'));
            return SizedBox(
              height: screenWidth * 27,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: snapshot.data?.size,
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenWidth * 17,
                          width: screenWidth * 23,
                          padding: EdgeInsets.all(screenWidth * 1.1),
                          margin:
                              EdgeInsets.symmetric(vertical: screenWidth * 1.5)
                                  .copyWith(right: 2),
                          decoration: BoxDecoration(
                            color: theme.appBackgroundColor,
                            boxShadow: AllShadows().boxShadow(),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: theme.appBackgroundColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(snapshot
                                            .data?.docs[index]
                                            .get('photo') ??
                                        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth,
                        ),
                        Text(
                            snapshot.data?.docs[index].get('city') ??
                                'jeju island',
                            style: TextStyle(
                                color: theme.darkTextColor,
                                fontSize: screenWidth * 2.8,
                                fontWeight: FontWeight.w400))
                      ],
                    );
                  }),
            );
          }
        });
  }

  Widget touristsAttractionsAroundMe() {
    return Container(
      height: 170,
      width: double.infinity,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/map.png'))),
    );
  }

  Widget onlineOrActivityTour() {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(15),
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
              child: onlineTourSelected
                  ? Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            onlineTourSelected = true;
                            tourAndActivitySelected = false;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Online tour',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          onlineTourSelected = true;
                          tourAndActivitySelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: onlineTourSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Online tour',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    )),
          Expanded(
              child: tourAndActivitySelected
                  ? Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            onlineTourSelected = false;
                            tourAndActivitySelected = true;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Tour & Activity',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          onlineTourSelected = false;
                          tourAndActivitySelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: tourAndActivitySelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Tour & Activity',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    ))
        ],
      ),
    );
  }

  Widget onlineOrActivityTourList() {
    return Column(
      children: [
        for (int i = 0; i < 5; i++)
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.only(right: 15, bottom: 15),
            decoration: BoxDecoration(
              color: theme.appBackgroundColor,
              borderRadius: BorderRadius.circular(15),
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
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/wallpaper.jpg'))),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('10 places you must visit in Seoul',
                              style: TextStyle(
                                  color: theme.darkTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                          Text('Seoul trip wal',
                              style: TextStyle(
                                  color: theme.darkTextColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: theme.appBackgroundColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 3,
                            spreadRadius: 2,
                            color: Colors.grey.shade300),
                        BoxShadow(
                            offset: const Offset(-2, -2),
                            blurRadius: 3,
                            spreadRadius: 2,
                            color: Colors.white70),
                      ],
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: theme.coloredButtonColor,
                      size: 23,
                    ),
                  ),
                ))
              ],
            ),
          ),
      ],
    );
  }
}
