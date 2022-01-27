import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

Widget exploreMeepsTravelers(screenWidth) {
  return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('users_profile').snapshots(),
      builder: (context, snapshot) {
        // print(snapshot.data?.docs[0].get('followedBy'));
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            height: screenWidth * 47,
            width: double.infinity,
            child: ListView.builder(
                itemCount: snapshot.data?.size,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Container(
                      width: screenWidth * 75,
                      margin: EdgeInsets.all(screenWidth * 3),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 3),
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
                                      .get('user_profile_image_url') ??
                                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(0, screenWidth * 3,
                              screenWidth * 3, screenWidth * 3),
                          margin: EdgeInsets.only(left: screenWidth * 10),
                          decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(screenWidth * 3),
                                  bottomRight:
                                      Radius.circular(screenWidth * 3))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: screenWidth * 3),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenWidth * 6.5,
                                        width: screenWidth * 6.5,
                                        margin: EdgeInsets.only(
                                            bottom: screenWidth * .5),
                                        padding:
                                            EdgeInsets.all(screenWidth * .8),
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
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(snapshot
                                                          .data?.docs[index]
                                                          .get(
                                                              'user_profile_image_url') ??
                                                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 2,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: screenWidth * 1.8),
                                            child: Text(
                                                snapshot.data?.docs[index]
                                                        .get('user_name') ??
                                                    'Lucky_seven',
                                                style: TextStyle(
                                                    color: theme.lightTextColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth * 3.3)),
                                          ),
                                          SizedBox(
                                            height: screenWidth * 1.5,
                                          ),
                                          Text(
                                              snapshot.data?.docs[index].get(
                                                      'user_introduction') ??
                                                  'Everyday travel,person',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: screenWidth * 2.9)),
                                          SizedBox(
                                            height: screenWidth * 3,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('Travel',
                                                      style: TextStyle(
                                                          color: theme
                                                              .lightTextColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              screenWidth * 3)),
                                                  SizedBox(height: screenWidth),
                                                  Text('35',
                                                      style: TextStyle(
                                                          color: theme
                                                              .darkTextColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              screenWidth *
                                                                  3.8)),
                                                ],
                                              ),
                                              SizedBox(
                                                width: screenWidth * 6,
                                              ),
                                              Column(
                                                children: [
                                                  Text('Plan',
                                                      style: TextStyle(
                                                          color: theme
                                                              .lightTextColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              screenWidth * 3)),
                                                  SizedBox(height: screenWidth),
                                                  Text('350',
                                                      style: TextStyle(
                                                          color: theme
                                                              .darkTextColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              screenWidth *
                                                                  3.8)),
                                                ],
                                              ),
                                              SizedBox(
                                                width: screenWidth * 6,
                                              ),
                                              Column(
                                                children: [
                                                  Text('Follower',
                                                      style: TextStyle(
                                                          color: theme
                                                              .lightTextColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              screenWidth * 3)),
                                                  SizedBox(height: screenWidth),
                                                  Text(
                                                      snapshot.data?.docs[index]
                                                              .get('followedBy')
                                                              .length
                                                              .toString() ??
                                                          '3575',
                                                      style: TextStyle(
                                                          color: theme
                                                              .darkTextColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              screenWidth *
                                                                  3.8)),
                                                ],
                                              ),
                                              SizedBox(
                                                width: screenWidth * 4,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenWidth * 5,
                                          ),
                                          Neumorphic(
                                            style: AllShadows()
                                                .neumorphicShadow(screenWidth),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        screenWidth * 3.7,
                                                    vertical:
                                                        screenWidth * 1.2),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          screenWidth * 90),
                                                  color:
                                                      theme.simpleButtonColor,
                                                ),
                                                child: Text(
                                                  'Following',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          theme.lightTextColor,
                                                      fontSize:
                                                          screenWidth * 2.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          )));
                }),
          );
        }
      });
}
