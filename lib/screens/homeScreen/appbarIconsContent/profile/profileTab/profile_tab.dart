import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/providers/profile_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/profileEditing/profile_editing.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/slidingPage3/sliding_page3.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/sliding_page1.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/slidingPage2/sliding_page2.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profileTab/slidingPagesList/slidingPage2/sliding_page2_filter.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Stack(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: screenWidth * 6),
          profileBlock(screenWidth, context),
          SizedBox(height: screenWidth * 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Travel',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 3.4)),
                  SizedBox(height: screenWidth * 1.5),
                  Text('35',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 4.6)),
                ],
              ),
              Column(
                children: [
                  Text('Plan',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 3.4)),
                  SizedBox(height: screenWidth * 1.5),
                  Text('205',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 4.6)),
                ],
              ),
              Column(
                children: [
                  Text('Follower',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 3.4)),
                  SizedBox(height: screenWidth * 1.5),
                  Text('9089',
                      style: TextStyle(
                          color: theme.darkTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 4.6)),
                ],
              ),
            ],
          ),
          SizedBox(height: screenWidth * 8),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 4),
            child: Text('Enjoy winter activities in Switzerland',
                style: TextStyle(
                    fontSize: screenWidth * 4.7,
                    color: theme.lightTextColor,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: screenWidth * 3),
          Padding(
            padding:
                EdgeInsets.only(right: screenWidth * 4, left: screenWidth * 4),
            child: enjoyWinterActivities(screenWidth),
          ),
          SizedBox(height: screenWidth * 4),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int i = 0; i < 3; i++)
              Neumorphic(
                margin: EdgeInsets.all(screenWidth),
                style: AllShadows().neumorphicShadow(screenWidth,
                    depth: i == selectedIndex ? 1 : -1),
                child: Container(
                  color: theme.appBackgroundColor,
                  height: SizeConfig.widthMultiplier * 2.3,
                  width: SizeConfig.widthMultiplier * 2.3,
                ),
              )
          ]),
          SizedBox(height: screenWidth * 4),
          SizedBox(
            width: double.infinity,
            height: screenWidth * 250,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: screenWidth * 4),
                    child: index == 0
                        ? SlidingPage1()
                        : index == 1
                            ? SlidingPage2()
                            : SlidingPage3(),
                  );
                }),
          )
        ]),
      ],
    );
  }
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

  AppBar appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey.shade600,
          size: 18,
        ),
      ),
      title: FutureBuilder<Object>(
          future: null,
          builder: (context, snapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
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
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/person.png'))),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'hhhhh',
                  style: TextStyle(color: theme.darkTextColor, fontSize: 20),
                ),
              ],
            );
          }),
      actions: [
        TextButton(
            onPressed: () {},
            child: Icon(
              Icons.more_horiz,
              color: theme.darkTextColor,
              size: 20,
            ))
      ],
    );
  }

  Widget profileBlock(screenWidth, _) {
    final profileProvider = Provider.of<ProfileProvider>(_);
    return FutureBuilder<DocumentSnapshot>(
        future: profileProvider.getUserProfileDetails(UserDetails.userId),
        builder: (context, snapshot) {
          //print(snapshot.data!['user_name']);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Container(
              margin: EdgeInsets.only(
                  right: screenWidth * 4, left: screenWidth * 4),
              height: screenWidth * 24,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 3, 0, screenWidth * 3, screenWidth * 5),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(screenWidth),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: AllShadows().boxShadow(),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 120),
                          child: Image.network(
                            snapshot.data!['user_profile_image_url'],
                            fit: BoxFit.cover,
                            height: screenWidth * 20,
                            width: screenWidth * 20,
                          )),
                    ),
                  )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(screenWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(left: screenWidth),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data!['user_name'],
                                              style: TextStyle(
                                                  color: theme.darkTextColor,
                                                  fontSize: screenWidth * 4,
                                                  fontWeight: FontWeight.w700)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileEditing()));
                                            },
                                            child: Container(
                                              height: screenWidth * 8,
                                              width: screenWidth * 8,
                                              padding: EdgeInsets.all(
                                                  screenWidth * 2.3),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow:
                                                    AllShadows().boxShadow(),
                                              ),
                                              child: Image.asset(
                                                  'assets/write.png'),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(snapshot.data!['user_bio'] ?? "Bio",
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 3,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenWidth * 1.4,
                                  horizontal: screenWidth * .3),
                              alignment: Alignment.center,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows().boxShadow(),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 80),
                                      ),
                                      child: Text(
                                          'Total travel distance 3938 km',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.2)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows().boxShadow(),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 80),
                                      ),
                                      child: Text('15 countries',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.2)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows().boxShadow(),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 80),
                                      ),
                                      child: Text('49 cities',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.2)),
                                    ),
                                  ]),
                            )),
                          ],
                        ),
                      ))
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(right: screenWidth * 4),
              height: screenWidth * 24,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 3, 0, screenWidth * 3, screenWidth * 5),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(screenWidth),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: AllShadows().boxShadow(),
                      ),
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 120),
                          child: Image.asset('assets/face_icons/female4.jpg')),
                    ),
                  )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(screenWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(left: screenWidth),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Lucky_seven',
                                              style: TextStyle(
                                                  color: theme.darkTextColor,
                                                  fontSize: screenWidth * 4,
                                                  fontWeight: FontWeight.w700)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileEditing()));
                                            },
                                            child: Container(
                                              height: screenWidth * 8,
                                              width: screenWidth * 8,
                                              padding: EdgeInsets.all(
                                                  screenWidth * 2.3),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: theme.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow:
                                                    AllShadows().boxShadow(),
                                              ),
                                              child: Image.asset(
                                                  'assets/write.png'),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text('Everyday today,travel',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 3,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenWidth * 1.4,
                                  horizontal: screenWidth * .3),
                              alignment: Alignment.center,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows().boxShadow(),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 80),
                                      ),
                                      child: Text(
                                          'Total travel distance 3938 km',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.2)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows().boxShadow(),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 80),
                                      ),
                                      child: Text('15 countries',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.2)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2.4),
                                      decoration: BoxDecoration(
                                        boxShadow: AllShadows().boxShadow(),
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 80),
                                      ),
                                      child: Text('49 cities',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 2.2)),
                                    ),
                                  ]),
                            )),
                          ],
                        ),
                      ))
                ],
              ),
            );
          }
        });
  }

  Widget enjoyWinterActivities(screenWidth) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 3, vertical: screenWidth * 2),
        decoration: BoxDecoration(
          boxShadow: AllShadows().boxShadow(),
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text('93km, 45 visits',
            style: TextStyle(
                color: theme.darkTextColor, fontSize: screenWidth * 2.6)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 3, vertical: screenWidth * 2),
        decoration: BoxDecoration(
          boxShadow: AllShadows().boxShadow(),
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text('jeju, south korea',
            style: TextStyle(
                color: theme.darkTextColor, fontSize: screenWidth * 2.6)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 3, vertical: screenWidth * 2),
        decoration: BoxDecoration(
          boxShadow: AllShadows().boxShadow(),
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text('jejs honeymoon,goog restaurant',
            style: TextStyle(
                color: theme.darkTextColor, fontSize: screenWidth * 2.6)),
      ),
    ]);
  }
}
