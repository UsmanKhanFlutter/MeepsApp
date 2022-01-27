import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/ListWidgets/exploreMeepsTraveler/explore_meeps_traveler.dart';
import 'package:meeps/components/widgets/ListWidgets/popularTravelPlacesOfWeek/popular_travel_places_of_week.dart';
import 'package:meeps/components/widgets/ListWidgets/popularTravelStoryList/popular_travel_story_list.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/providers/meeps_tv_provider.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/airplaneTicket/airplane_ticket.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

import 'luckySeven/lucky_seven.dart';

class HomeContent extends StatelessWidget {
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
              padding:
                  EdgeInsets.fromLTRB(screenWidth * 4, screenWidth * 4, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBlock(screenWidth, context),
                  title('Meeps Popular Traveler', screenWidth),
                  popularTravelList(context, screenWidth),
                  title('Meeps Tour Guide', screenWidth),
                  meepsTourGuide(screenWidth),
                  title('Where Shall We Go?', screenWidth),
                  citiesList(screenWidth, context),
                  title('Popular Travel Place This Week', screenWidth),
                  popularTravelPlacesOfWeek(context, screenWidth),
                  title('Popular Travel Story', screenWidth),
                  popularTravelStoryList(context, screenWidth),
                  title('See the Meep\'s Travelers', screenWidth),
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

  Widget meepsTourGuide(screenWidth) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('admin_setting_main_banner')
            .snapshots(),
        builder: (context, snapshot) {
          //print(snapshot.data?.docs[0].get('thumbnail'));
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox(
              height: screenWidth * 43,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(screenWidth * 3),
                      width: screenWidth * 80,
                      margin: EdgeInsets.all(screenWidth * 3),
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
                              image: AssetImage('assets/roomm.jpg'))),
                      child: Text('123 lucky Seven',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 4.5,
                              fontWeight: FontWeight.w600)),
                    );
                  }),
            );
          }
        });
  }

  Widget title(title, screenWidth) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: screenWidth * 8),
      Text(title,
          style: TextStyle(
              fontSize: screenWidth * 4.7,
              color: theme.lightTextColor,
              fontWeight: FontWeight.w600)),
      SizedBox(height: screenWidth * 2.7),
    ]);
  }

  Widget topBlock(screenWidth, context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AirplaneTicket()));
      },
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('admin_setting_main_banner')
              .snapshots(),
          builder: (context, snapshot) {
            print(UserDetails.adminStorageUrl +
                snapshot.data?.docs[0].get('thumbnail'));
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 3, screenWidth * 3, screenWidth * 3, 0),
                margin: EdgeInsets.only(right: screenWidth * 4),
                height: screenWidth * 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: AllShadows().boxShadow(),
                    borderRadius: BorderRadius.circular(screenWidth * 4),
                    color: theme.mainColor,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(UserDetails.adminStorageUrl +
                                snapshot.data?.docs[0].get('thumbnail')))),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Only Meeps!',
                            style: GoogleFonts.ptSans(
                                fontSize: screenWidth * 5,
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: screenWidth * 1.5,
                          ),
                          Text(
                              snapshot.data?.docs[0].get('title') ??
                                  'Special price for airplane ticket!',
                              style: GoogleFonts.ptSans(
                                  fontSize: screenWidth * 7.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('assets/person.png'),
                    ))
                  ],
                ),
              );
            }
          }),
    );
  }
}

Widget citiesList(screenWidth, _) {
  final meepsTvProvider = Provider.of<MeepsTvProvider>(_);
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('admin_cities').snapshots(),
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
                                  image: NetworkImage(UserDetails
                                              .adminStorageUrl +
                                          snapshot.data?.docs[0].get('photo')))),
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

Widget popularTravelList(context, screenWidth) {
  final postProvider = Provider.of<PostProvider>(context);
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // print(snapshot.data?.docs[0].get('post_images_urls')[0]);
          return Container(
            height: screenWidth * 55,
            width: double.infinity,
            child: ListView.builder(
                itemCount: snapshot.data?.size,
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (snapshot.data?.docs[index].get('user_id') !=
                      UserDetails.userId) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => LuckySeven()));
                      },
                      child: SizedBox(
                        height: screenWidth * 53,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: screenWidth * 80,
                                margin: EdgeInsets.all(screenWidth * 2),
                                padding: EdgeInsets.all(screenWidth * 3),
                                decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 3),
                                  boxShadow: AllShadows().boxShadow(),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: screenWidth * 2),
                                                  child: Text(
                                                      snapshot.data?.docs[index]
                                                              .get(
                                                                  'post_pictures_title') ??
                                                          'Jeju Island in August Honeymoon 7 nights 8 days!! I went on only a budget of 150,000 won :)',
                                                      style: TextStyle(
                                                          color: theme
                                                              .lightTextColor,
                                                          fontSize:
                                                              screenWidth * 3)),
                                                ),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                alignment: Alignment.topCenter,
                                                margin:
                                                    EdgeInsets.all(screenWidth),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(snapshot
                                                                .data
                                                                ?.docs[index]
                                                                .get(
                                                                    'post_images_urls')[0] ??
                                                            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                                              ))
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                      padding:
                                          EdgeInsets.all(screenWidth * 1.5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: screenWidth * 2),
                                              decoration: BoxDecoration(
                                                boxShadow:
                                                    AllShadows().boxShadow(
                                                  darkBlurRadius: 3,
                                                  darkSpreadRadius: 0,
                                                ),
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Text('93km, 45 visits',
                                                  style: TextStyle(
                                                      color:
                                                          theme.darkTextColor,
                                                      fontSize:
                                                          screenWidth * 2.4)),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: screenWidth * 2),
                                              decoration: BoxDecoration(
                                                boxShadow:
                                                    AllShadows().boxShadow(
                                                  darkBlurRadius: 3,
                                                  darkSpreadRadius: 0,
                                                ),
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Text('jej,s korea',
                                                  style: TextStyle(
                                                      color:
                                                          theme.darkTextColor,
                                                      fontSize:
                                                          screenWidth * 2.4)),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: screenWidth * 2),
                                              decoration: BoxDecoration(
                                                boxShadow:
                                                    AllShadows().boxShadow(
                                                  darkBlurRadius: 3,
                                                  darkSpreadRadius: 0,
                                                ),
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Text('jeju destination',
                                                  style: TextStyle(
                                                      color:
                                                          theme.darkTextColor,
                                                      fontSize:
                                                          screenWidth * 2.4)),
                                            ),
                                          ]),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            FutureBuilder<DocumentSnapshot<Object?>>(
                                future: postProvider.getUserDetailsFromId(
                                    snapshot.data?.docs[index].get('user_id')),
                                builder: (context, snapshots) {
                                  //print(snapshots.data?.get('user_bio'));
                                  if (!snapshots.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LuckySeven(
                                                        userId: snapshot
                                                            .data?.docs[index]
                                                            .get('user_id'))));
                                      },
                                      child: Container(
                                        height: screenWidth * 8.3,
                                        width: screenWidth * 80,
                                        padding: EdgeInsets.only(
                                            bottom: screenWidth * .6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              Container(
                                                height: screenWidth * 8,
                                                width: screenWidth * 8,
                                                padding: EdgeInsets.all(
                                                    screenWidth * .8),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 2,
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        color: Colors
                                                            .grey.shade400),
                                                    BoxShadow(
                                                        offset: Offset(-2, -2),
                                                        blurRadius: 4,
                                                        spreadRadius: 2,
                                                        color: Colors.white70),
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: NetworkImage(
                                                              snapshots.data?.get(
                                                                      'user_profile_image_url') ??
                                                                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 1.7,
                                              ),
                                              Text(
                                                  snapshots.data
                                                          ?.get('user_name') ??
                                                      'Lucky_seven',
                                                  style: TextStyle(
                                                      color:
                                                          theme.lightTextColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          screenWidth * 2.9))
                                            ]),
                                            Row(
                                              children: [
                                                Row(children: [
                                                  Image.asset(
                                                    'assets/heart_colored.png',
                                                    width: screenWidth * 4.5,
                                                    height: screenWidth * 4.5,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 1.3,
                                                  ),
                                                  Text('2728',
                                                      style: TextStyle(
                                                          color: theme
                                                              .lightTextColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              screenWidth * 3))
                                                ]),
                                                SizedBox(
                                                  width: screenWidth * 2.8,
                                                ),
                                                Row(children: [
                                                  Image.asset(
                                                    'assets/bottom_navigation_icons/chat.png',
                                                    width: screenWidth * 4.5,
                                                    height: screenWidth * 4.5,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 1.3,
                                                  ),
                                                  Text('999',
                                                      style: TextStyle(
                                                          color: theme
                                                              .lightTextColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              screenWidth * 3))
                                                ]),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                })
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          );
        }
      });
}
