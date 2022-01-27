import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/providers/user_provider.dart';
import 'package:meeps/screens/homeScreen/homeContent/luckySeven/luckySevenSlideUpDetails/lucky_seven_slide_up_details.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class LuckySeven extends StatefulWidget {
  final String? userId;
  @override
  _LuckySevenState createState() => _LuckySevenState();
  LuckySeven({Key? key, this.userId}) : super(key: key);
}

class _LuckySevenState extends State<LuckySeven> {
  @override
  Widget build(BuildContext context) {
    var provData = Provider.of<StateSettingProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context, screenWidth),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
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
                            profileBlock(
                                provData, widget.userId.toString(), context),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('Travel',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.4)),
                                    SizedBox(height: 5),
                                    Text('35',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    4.6)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Plan',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.4)),
                                    SizedBox(height: 5),
                                    Text('205',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    4.6)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Follower',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.4)),
                                    SizedBox(height: 5),
                                    Text('9089',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    4.6)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text('Enjoy winter activities in Switzerland',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: enjoyWinterActivities(),
                            ),
                            SizedBox(height: 30),
                            Container(
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
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/map.png'))),
                            ),
                            SizedBox(height: 30),
                            gridPhotos(),
                            SizedBox(height: 30),
                            Text('Enjoy winter activities in Switzerland',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: enjoyWinterActivities(),
                            ),
                            SizedBox(height: 30),
                            Container(
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
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/map.png'))),
                            ),
                            SizedBox(height: 30),
                            Container(
                              height: 400,
                              width: double.infinity,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(3, 3),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                        color: Colors.grey.shade400),
                                    BoxShadow(
                                        offset: const Offset(-2, -2),
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        color: Colors.white),
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/wallpaper.jpg'))),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconTheme(
                                            data: IconThemeData(size: 10),
                                            child: Icon(Icons.location_on,
                                                color: theme.darkTextColor,
                                                size: 17),
                                          ),
                                          Text('switzerland,switzerland',
                                              style: TextStyle(
                                                  color: theme.darkTextColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14))
                                        ],
                                      ),
                                      Text('01/03/2021',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(
                                        'It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.It is an awesome destination.',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.5)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.widthMultiplier * 2,
                                            vertical:
                                                SizeConfig.widthMultiplier *
                                                    1.8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: const Offset(1, 1),
                                                spreadRadius: 1,
                                                color: Colors.grey.shade400),
                                            const BoxShadow(
                                                offset: Offset(-2, -2),
                                                blurRadius: 4,
                                                spreadRadius: 2,
                                                color: Colors.white),
                                          ],
                                          color: theme.appBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text('impressions',
                                            style: TextStyle(
                                                color: theme.darkTextColor,
                                                fontSize:
                                                    SizeConfig.widthMultiplier *
                                                        2.4)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.widthMultiplier * 2,
                                            vertical:
                                                SizeConfig.widthMultiplier *
                                                    1.8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: const Offset(1, 1),
                                                spreadRadius: 1,
                                                color: Colors.grey.shade400),
                                            const BoxShadow(
                                                offset: Offset(-2, -2),
                                                blurRadius: 4,
                                                spreadRadius: 2,
                                                color: Colors.white),
                                          ],
                                          color: theme.appBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text('likes',
                                            style: TextStyle(
                                                color: theme.darkTextColor,
                                                fontSize:
                                                    SizeConfig.widthMultiplier *
                                                        2.4)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  reactionIcons(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  comments(),
                                  SizedBox(height: 30),
                                  Text('Packages this traveler participated',
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            packageThisTravelerParticipated()
                          ],
                        ),
                      ),
                      SizedBox(height: 120)
                    ],
                  ),
                ),
              ),
              provData.showLuckySevenSlidingUpDetails
                  ? LuckySevenSlideUpDetails()
                  : SizedBox(),
              bottomNavigationBar()
            ],
          ),
        ),
      ),
    );
  }
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

  AppBar appBar(context, screenWidth) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: popNavigation(context, screenWidth),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenWidth * 7,
            width: screenWidth * 7,
            margin: EdgeInsets.only(bottom: screenWidth * .3),
            padding: EdgeInsets.all(screenWidth * .6),
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
          Text(
            'lucky_seven',
            style: TextStyle(
                color: theme.darkTextColor, fontSize: screenWidth * 4.5),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Icon(
              Icons.more_horiz,
              color: theme.darkTextColor,
              size: screenWidth * 6,
            ))
      ],
    );
  }

  Widget profileBlock(
      StateSettingProvider provData, String user_id, BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    //print(user_id);
    return StreamBuilder<DocumentSnapshot<Object?>>(
        stream: postProvider.getUserDetailsFromId(user_id).asStream(),
        builder: (context, snapshots) {
          //print();
          if (!snapshots.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(right: 15),
              height: SizeConfig.widthMultiplier * 24,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      provData.showLuckySevenSlidingUpDetailsBLock();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: theme.appBackgroundColor,
                            shape: BoxShape.circle,
                            boxShadow: AllShadows().boxShadow()),
                        child: Container(
                          decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(snapshots.data
                                          ?.get('user_profile_image_url') ??
                                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'))),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              snapshots.data
                                                      ?.get('user_name') ??
                                                  'Lucky_seven',
                                              style: TextStyle(
                                                  color: theme.darkTextColor,
                                                  fontSize: SizeConfig
                                                          .widthMultiplier *
                                                      4,
                                                  fontWeight: FontWeight.w700)),
                                          GestureDetector(
                                            onTap: () {
                                              // print("follow?");
                                              setState(() {
                                                userProvider.followUsers(
                                                    UserDetails.userId,
                                                    user_id,
                                                    context);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .widthMultiplier *
                                                      6,
                                                  vertical: SizeConfig
                                                          .widthMultiplier *
                                                      1.5),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: theme.coloredButtonColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(2, 2),
                                                      blurRadius: 3,
                                                      spreadRadius: 2,
                                                      color:
                                                          Colors.grey.shade200),
                                                ],
                                              ),
                                              child: Text(
                                                  snapshots.data
                                                              ?.get(
                                                                  'followedBy')
                                                              .contains(
                                                                  UserDetails
                                                                      .userId) ==
                                                          true
                                                      ? 'Following'
                                                      : 'Follow',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: SizeConfig
                                                              .widthMultiplier *
                                                          3.3,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text('Everyday today,travel',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      3,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 2),
                              alignment: Alignment.center,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              offset: const Offset(1, 1),
                                              spreadRadius: 1,
                                              color: Colors.grey.shade400),
                                          const BoxShadow(
                                              offset: Offset(-2, -2),
                                              blurRadius: 4,
                                              spreadRadius: 2,
                                              color: Colors.white),
                                        ],
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                          '93km, 45 visits 54 impressions',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      2.2)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              offset: const Offset(1, 1),
                                              spreadRadius: 1,
                                              color: Colors.grey.shade400),
                                          const BoxShadow(
                                              offset: Offset(-2, -2),
                                              blurRadius: 4,
                                              spreadRadius: 2,
                                              color: Colors.white),
                                        ],
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text('jej,s korea',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      2.2)),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              offset: const Offset(1, 1),
                                              spreadRadius: 1,
                                              color: Colors.grey.shade400),
                                          const BoxShadow(
                                              offset: Offset(-2, -2),
                                              blurRadius: 4,
                                              spreadRadius: 2,
                                              color: Colors.white),
                                        ],
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text('jeju destination',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      2.2)),
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

  Widget enjoyWinterActivities() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 3,
            vertical: SizeConfig.widthMultiplier * 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(1, 1),
                spreadRadius: 1,
                color: Colors.grey.shade400),
            const BoxShadow(
                offset: Offset(-2, -2),
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.white),
          ],
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text('93km, 45 visits 54 impressions',
            style: TextStyle(
                color: theme.darkTextColor,
                fontSize: SizeConfig.widthMultiplier * 2.6)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 3,
            vertical: SizeConfig.widthMultiplier * 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(1, 1),
                spreadRadius: 1,
                color: Colors.grey.shade400),
            const BoxShadow(
                offset: Offset(-2, -2),
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.white),
          ],
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text('jeju destination',
            style: TextStyle(
                color: theme.darkTextColor,
                fontSize: SizeConfig.widthMultiplier * 2.6)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 3,
            vertical: SizeConfig.widthMultiplier * 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(1, 1),
                spreadRadius: 1,
                color: Colors.grey.shade400),
            const BoxShadow(
                offset: Offset(-2, -2),
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.white),
          ],
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text('jejs,korea',
            style: TextStyle(
                color: theme.darkTextColor,
                fontSize: SizeConfig.widthMultiplier * 2.6)),
      ),
    ]);
  }

  Widget gridPhotos() {
    return Container(
        alignment: Alignment.center,
        height: SizeConfig.widthMultiplier * 97,
        width: double.infinity,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.grey.shade300),
          ],
        ),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: .96),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/wallpaper.jpg'))),
              );
            }));
  }

  Widget reactionIcons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/heart_colored.png',
                height: 16,
                width: 16,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/bottom_navigation_icons/chat.png',
                height: 16,
                width: 16,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/share.png',
                height: 15,
                width: 15,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/save.png',
                height: 15,
                width: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text('4,653 like this',
              style: TextStyle(
                  color: theme.darkTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 10)),
        )
      ],
    );
  }

  Widget comments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < 2; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          width: 10,
                        ),
                        Flexible(
                            child: RichText(
                                text: TextSpan(children: [
                          TextSpan(
                              text: 'Patricia mati ',
                              style: TextStyle(
                                  color: theme.darkTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                          TextSpan(
                              text:
                                  ' Really an awesome experience with this place. loved it.',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400))
                        ]))),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: theme.coloredButtonColor,
                            size: 10,
                          ),
                          Text(' 11 likes',
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        SizedBox(height: 6),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Comment',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(6, 2, 0, 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(1, 1),
                          spreadRadius: 1,
                          color: Colors.grey.shade400),
                      const BoxShadow(
                          offset: Offset(-2, -2),
                          blurRadius: 4,
                          spreadRadius: 2,
                          color: Colors.white),
                    ],
                    color: theme.appBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Enter',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: theme.lightTextColor,
                          fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget packageThisTravelerParticipated() {
    return Container(
      height: 220,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(10),
                width: 140,
                margin: const EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                        color: Colors.grey.shade300),
                    BoxShadow(
                        offset: const Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 1,
                        color: Colors.white70),
                  ],
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/roomm.jpg'))
                ),
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
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
                                image: AssetImage('assets/roomm.jpg'))),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 3),
                              Text('A beautiful place that deserves a visit.',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('12/08/2021',
                                    style: TextStyle(
                                        color: theme.lightTextColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ))),
                ]));
          }),
    );
  }
}
