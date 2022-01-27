import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:meeps/screens/homeScreen/homeContent/luckySeven/lucky_seven.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

Widget popularTravelStoryList(context, screenWidth) {
  final postProvider = Provider.of<PostProvider>(context);
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: screenWidth * 68,
            width: double.infinity,
            child: ListView.builder(
                itemCount: snapshot.data?.size,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  if (snapshot.data?.docs[index].get('user_id') !=
                      UserDetails.userId) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 3),
                          width: screenWidth * 40,
                          height: screenWidth * 53,
                          margin: EdgeInsets.all(screenWidth * 3),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 3),
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
                                          .get('post_images_urls')[0] ??
                                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: screenWidth * 5,
                                  ),
                                  Text('123 lucky Seven',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 3.5,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * .5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: screenWidth * 2),
                                child: Text(
                                    snapshot.data?.docs[index]
                                            .get('post_pictures_title') ??
                                        'I am so much happy here!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 2.5,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                        FutureBuilder<DocumentSnapshot<Object?>>(
                            future: postProvider.getUserDetailsFromId(
                                snapshot.data?.docs[index].get('user_id')),
                            builder: (context, snapshots) {
                              if (!snapshots.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => LuckySeven(
                                                userId: snapshot
                                                    .data?.docs[index]
                                                    .get('user_id'))));
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: screenWidth * 3),
                                    child: Row(children: [
                                      Container(
                                        height: screenWidth * 7,
                                        width: screenWidth * 7,
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
                                                  image: NetworkImage(snapshots
                                                          .data
                                                          ?.get(
                                                              'user_profile_image_url') ??
                                                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 2,
                                      ),
                                      Text(
                                          snapshots.data?.get('user_name') ??
                                              'Lucky_seven',
                                          style: TextStyle(
                                              color: theme.lightTextColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenWidth * 3))
                                    ]),
                                  ),
                                );
                              }
                            }),
                      ],
                    );
                  } else {
                    return Center();
                  }
                }),
          );
        }
      });
}
