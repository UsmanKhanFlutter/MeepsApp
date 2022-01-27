import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

Widget popularTravelPlacesOfWeek(context, screenWidth) {
  return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('admin_ad_banners').snapshots(),
      builder: (context, snapshot) {
        //print(snapshot.data?.docs[0].get('date'));
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: screenWidth * 58,
            width: double.infinity,
            child: ListView.builder(
                itemCount: snapshot.data?.size,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(screenWidth * 2),
                      width: screenWidth * 35,
                      margin: EdgeInsets.fromLTRB(screenWidth * 2,
                          screenWidth * 3, screenWidth * 2, screenWidth * 3),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                        borderRadius: BorderRadius.circular(screenWidth * 3),
                        boxShadow: AllShadows().boxShadow(),
                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: AssetImage('assets/roomm.jpg'))
                      ),
                      child: Column(children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: screenWidth * 1.5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 2.5),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                        color: Colors.grey.shade400),
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot
                                              .data?.docs[index]
                                              .get('image') ??
                                          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                            )),
                        Expanded(
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenWidth * 7,
                                      width: screenWidth * 7,
                                      margin: EdgeInsets.only(
                                          bottom: screenWidth * .9),
                                      padding: EdgeInsets.all(screenWidth * .8),
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
                                                        .get('image') ??
                                                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 1.5,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: screenWidth * .5),
                                          Text(
                                              snapshot.data?.docs[index]
                                                      .get('title') ??
                                                  'A place you must visit in Seoul',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontSize: screenWidth * 3,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(height: screenWidth * .5),
                                          Text('lucky7+4k views',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontSize: screenWidth * 2.3,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    )
                                  ],
                                ))),
                      ]));
                }),
          );
        }
      });
}
