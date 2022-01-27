import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/ListWidgets/exploreMeepsTraveler/explore_meeps_traveler.dart';
import 'package:meeps/components/widgets/ListWidgets/popularTravelList/popular_travel_list.dart';
import 'package:meeps/components/widgets/ListWidgets/popularTravelStoryList/popular_travel_story_list.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

class PopularPostAndFollowing extends StatefulWidget {
  @override
  _PopularPostAndFollowingState createState() =>
      _PopularPostAndFollowingState();
}

class _PopularPostAndFollowingState extends State<PopularPostAndFollowing> {
  bool popularPostSelected = true;
  bool followingSelected = false;
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
                  onlineOrActivityTour(),
                  SizedBox(height: 30),
                  Text('Popular Travel Plans',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  popularTravelList(context, screenWidth),
                  SizedBox(height: 30),
                  Text('Popular Travel Story',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  popularTravelStoryList(context, screenWidth),
                  SizedBox(height: 30),
                  Text('Explore Meeps Travelers!',
                      style: TextStyle(
                          fontSize: 19,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  exploreMeepsTravelers(screenWidth)
                ],
              ),
            ),
            SizedBox(height: 120)
          ],
        ),
      ),
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
              child: popularPostSelected
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
                            popularPostSelected = true;
                            followingSelected = false;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Popular post',
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
                          popularPostSelected = true;
                          followingSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: popularPostSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Popular post',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    )),
          Expanded(
              child: followingSelected
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
                            popularPostSelected = false;
                            followingSelected = true;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Following',
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
                          popularPostSelected = false;
                          followingSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: followingSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Following',
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
}
