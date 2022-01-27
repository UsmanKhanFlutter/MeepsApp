import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profile.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

import 'addNewPostPhotoDateSelect/add_new_post_photo_date_select.dart';
import 'allFriendsList/all_friends_list.dart';
import 'existingPostSlideUp/existing_post_slide_up.dart';

class AddNewPostPhotoDetails extends StatefulWidget {
  final String startDate;
  final String endDate;

  AddNewPostPhotoDetails(
      {Key? key, this.startDate = '11.07.2021', this.endDate = '11.09.2022'})
      : super(key: key);

  @override
  _AddNewPostPhotoDetailsState createState() => _AddNewPostPhotoDetailsState();
}

class _AddNewPostPhotoDetailsState extends State<AddNewPostPhotoDetails> {
  bool selectTravelDate = false;
  bool showCreatePostAlertBox = false;
  List<String> friendsTagsList = [
    'jeju',
    'nino',
    'scott',
    'dan',
    'jeff seid',
    'sergie constance',
    'ronaldo'
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var postProvider = Provider.of<PostProvider>(context, listen: false);
    var provData = Provider.of<StateSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context, screenWidth),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: screenWidth * 4),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenWidth * 1.5),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Text(
                        'Title of post',
                        style: TextStyle(
                            color: theme.darkTextColor,
                            fontSize: screenWidth * 3.8,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: screenWidth * 1.5),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Neumorphic(
                          style: AllShadows().neumorphicShadow(screenWidth),
                          child: TextField(
                            onChanged: (value) {
                              postProvider.post.postTitle = value;
                            },
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: screenWidth * 3.6,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.simpleButtonColor,
                              border: InputBorder.none,
                              hintText: 'Enter title',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: screenWidth * 3.6,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ),
                    SizedBox(height: screenWidth * 6),
                    SizedBox(
                      height: screenWidth * 24,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: screenWidth * 4),
                              child: Neumorphic(
                                  style: AllShadows()
                                      .neumorphicShadow(screenWidth),
                                  child: TextField(
                                    maxLines: 5,
                                    onChanged: (value) {
                                      postProvider.post.titleOfPicture = value;
                                    },
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: screenWidth * 3.6,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: theme.simpleButtonColor,
                                      border: InputBorder.none,
                                      hintText: 'Enter desciption',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: screenWidth * 3.6,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 2),
                            alignment: Alignment.bottomRight,
                            width: screenWidth * 25,
                            margin: EdgeInsets.only(
                                left: screenWidth * 3, right: screenWidth * 4),
                            decoration: BoxDecoration(
                                boxShadow: AllShadows().boxShadow(),
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 2),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/aquarium.png'))),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                'assets/ticket.png',
                                height: screenWidth * 5,
                                width: screenWidth * 5,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 6),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Text(
                        'Travel date',
                        style: TextStyle(
                            color: theme.darkTextColor,
                            fontSize: screenWidth * 3.8,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: screenWidth * 1.5),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectTravelDate = !selectTravelDate;
                          });
                        },
                        child: Container(
                            height: selectTravelDate
                                ? SizeConfig.widthMultiplier * 21
                                : SizeConfig.widthMultiplier * 13,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthMultiplier * 3.5),
                            decoration: BoxDecoration(
                                color: theme.appBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: AllShadows().boxShadow()),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (!selectTravelDate) SizedBox(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            widget.startDate == ''
                                                ? '11.07.2021'
                                                : widget.startDate,
                                            style: TextStyle(
                                                color: selectTravelDate
                                                    ? theme.lightTextColor!
                                                        .withOpacity(.6)
                                                    : theme.lightTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    SizeConfig.widthMultiplier *
                                                        3.6)),
                                        SizedBox(
                                          width: screenWidth,
                                        ),
                                        Text('starting date',
                                            style: TextStyle(
                                                color: selectTravelDate
                                                    ? theme.lightTextColor!
                                                        .withOpacity(.6)
                                                    : theme.lightTextColor!
                                                        .withOpacity(.8),
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    SizeConfig.widthMultiplier *
                                                        2.7))
                                      ],
                                    ),
                                    selectTravelDate
                                        ? SizedBox()
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddNewPostPhotoDateSelect()));
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: theme.lightTextColor,
                                              size: screenWidth * 3.5,
                                            ),
                                          )
                                  ],
                                ),
                                !selectTravelDate
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  widget.endDate == ''
                                                      ? '11.07.2021'
                                                      : widget.endDate,
                                                  style: TextStyle(
                                                      color:
                                                          theme.lightTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: SizeConfig
                                                              .widthMultiplier *
                                                          3.6)),
                                              SizedBox(
                                                width: screenWidth,
                                              ),
                                              Text('ending date',
                                                  style: TextStyle(
                                                      color: theme
                                                          .lightTextColor!
                                                          .withOpacity(.8),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: SizeConfig
                                                              .widthMultiplier *
                                                          2.9))
                                            ],
                                          ),
                                          SizedBox()
                                        ],
                                      ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(height: screenWidth * 6),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Text(
                        'Travel place',
                        style: TextStyle(
                            color: theme.darkTextColor,
                            fontSize: screenWidth * 3.8,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: screenWidth * 1.5),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Neumorphic(
                          style: AllShadows().neumorphicShadow(screenWidth),
                          child: TextField(
                            onChanged: (value) {
                              postProvider.post.travelPlace = value;
                            },
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: screenWidth * 3.6,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.simpleButtonColor,
                              border: InputBorder.none,
                              hintText: 'Lotschental, Blatten, Switzerland',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: screenWidth * 3.6,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ),
                    SizedBox(height: screenWidth * 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllFriendsList()));
                      },
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          height: SizeConfig.widthMultiplier * 13,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 3.5),
                          decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: AllShadows().boxShadow()),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tag friend',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          SizeConfig.widthMultiplier * 3.6)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: theme.lightTextColor,
                                size: screenWidth * 3.5,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Wrap(
                        children: [
                          for (int i = 0; i < friendsTagsList.length; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  friendsTagsList.removeAt(i);
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.all(screenWidth * 1.5),
                                      margin: EdgeInsets.only(
                                          right: screenWidth * 3,
                                          bottom: screenWidth * 3),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 1.3),
                                        color: theme.appBackgroundColor,
                                        boxShadow: AllShadows().boxShadow(
                                            darkBlurRadius: 3,
                                            darkSpreadRadius: 1,
                                            lightBlurRadius: 2,
                                            lightSpreadRadius: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(friendsTagsList[i],
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontSize: screenWidth * 3)),
                                          SizedBox(width: screenWidth * 2.8),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  screenWidth * .5),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: theme.appBackgroundColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 4,
                                                      offset:
                                                          const Offset(1, 1),
                                                      spreadRadius: 1,
                                                      color:
                                                          Colors.grey.shade400),
                                                  const BoxShadow(
                                                      offset: Offset(-2, -2),
                                                      blurRadius: 4,
                                                      spreadRadius: 2,
                                                      color: Colors.white),
                                                ],
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                                size: screenWidth * 2.8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: selectTravelDate
                          ? screenWidth * 20
                          : screenWidth * 28,
                    ),
                    buttons(screenWidth, provData),
                    SizedBox(
                      height: screenWidth * 3,
                    ),
                  ],
                ),
              ),
            ),
            !showCreatePostAlertBox
                ? SizedBox()
                : createPostAlertBox(screenWidth, postProvider),
            !provData.showExistingPostSlideUp
                ? SizedBox()
                : ExistingPostSlideUp(),
            !provData.showExistingPostAlertBox
                ? SizedBox()
                : existingPostAlertBox(screenWidth, provData),
          ],
        ),
      ),
    );
  }

  AppBar appBar(context, screenWidth) {
    return AppBar(
      shadowColor: theme.lightTextColor!.withOpacity(.3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 3),
              bottomRight: Radius.circular(screenWidth * 3))),
      backgroundColor: theme.appBackgroundColor,
      centerTitle: true,
      leading: popNavigation(context, screenWidth),
      title: Text(
        'New post',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
    );
  }

  Widget buttons(screenWidth, StateSettingProvider provdata) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              provdata.showExistingPostSlideUpBLock();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Add to existing post',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showCreatePostAlertBox = true;
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Create a post',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget createPostAlertBox(screenWidth, var postProvider) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Container(
          height: screenWidth * 32,
          width: screenWidth * 75,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 6, vertical: screenWidth * 4),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(screenWidth * 4),
              color: theme.appBackgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 2),
                child: Text(
                  'Would you like to create a post?',
                  style: TextStyle(
                      color: theme.lightTextColor, fontSize: screenWidth * 3.9),
                ),
              ),
              createPostAlertBoxButtons(screenWidth, postProvider)
            ],
          ),
        ),
      ),
    );
  }

  Widget createPostAlertBoxButtons(screenWidth, PostProvider postProvider) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showCreatePostAlertBox = false;
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              setState(() {
                showCreatePostAlertBox = false;
              });

              postProvider.post.travelDateTime = '11.07.2021';
              if (postProvider.post.postTitle.toString().trim().isNotEmpty &&
                  postProvider.post.titleOfPicture
                      .toString()
                      .trim()
                      .isNotEmpty &&
                  postProvider.post.travelDateTime
                      .toString()
                      .trim()
                      .isNotEmpty &&
                  postProvider.post.travelPlace.toString().trim().isNotEmpty &&
                  postProvider.post.postPhotos.length != 0) {
                bool checkStatus =
                    await postProvider.createPost(postProvider.post);
                if (checkStatus) {
                  Fluttertoast.showToast(
                      msg: "Your post has been successfully uploaded.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: screenWidth * 2);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Profile()));
                } else {
                  Fluttertoast.showToast(
                      msg: "Your post has been failed to upload.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: screenWidth * 2);
                }
              } else {
                print(postProvider.post.postTitle);
                print(postProvider.post.titleOfPicture);
                print(postProvider.post.travelDateTime);
                print(postProvider.post.travelPlace);
                print(postProvider.post.postPhotos.length);
                Fluttertoast.showToast(
                    msg: "Fill All Post Details.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: screenWidth * 4);
              }
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Ok',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget existingPostAlertBox(screenWidth, StateSettingProvider provData) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Container(
          height: screenWidth * 32,
          width: screenWidth * 75,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 6, vertical: screenWidth * 4),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(screenWidth * 4),
              color: theme.appBackgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 2),
                child: Text(
                  'Would you like to create a post?',
                  style: TextStyle(
                      color: theme.lightTextColor, fontSize: screenWidth * 3.9),
                ),
              ),
              existingPostAlertBoxButtons(screenWidth, provData)
            ],
          ),
        ),
      ),
    );
  }

  Widget existingPostAlertBoxButtons(
      screenWidth, StateSettingProvider provData) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              provData.hideExistingPostAlertBLock();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              provData.hideExistingPostAlertBLock();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Ok',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
