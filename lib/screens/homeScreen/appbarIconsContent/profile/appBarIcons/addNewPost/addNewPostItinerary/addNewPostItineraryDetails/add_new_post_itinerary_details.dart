import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryDateSelect/add_new_post_itinerary_date_select.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryTravelPlanning/add_new_post_itinerary_travel_planning.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/profile.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class AddNewPostItineraryDetails extends StatefulWidget {
  const AddNewPostItineraryDetails({Key? key}) : super(key: key);

  @override
  _AddNewPostItineraryDetailsState createState() =>
      _AddNewPostItineraryDetailsState();
}

class _AddNewPostItineraryDetailsState
    extends State<AddNewPostItineraryDetails> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  bool selectTravelDate = false;
  bool showCreatePostAlertBox = false;

  void getImageFromGallery() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;

    var provData = Provider.of<StateSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context, screenWidth),
        body: Container(
          padding: EdgeInsets.only(top: screenWidth * 4),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth * 4),
                GestureDetector(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: screenWidth * 44,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      decoration: BoxDecoration(
                          boxShadow: AllShadows().boxShadow(),
                          borderRadius: BorderRadius.circular(screenWidth * 3),
                          color: theme.appBackgroundColor,
                          image: _imageFile != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(_imageFile!))
                              : null),
                      child: _imageFile != null
                          ? SizedBox()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 10,
                                  width: screenWidth * 10,
                                  child: Image.asset('assets/gallery.png',
                                      color: Colors.grey.shade300),
                                ),
                                SizedBox(
                                  height: screenWidth * 2,
                                ),
                                Text(
                                  'Upload photo',
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 3.5),
                                )
                              ],
                            )),
                ),
                SizedBox(height: screenWidth * 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                  child: Text(
                    'Title of travel',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: screenWidth * 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                  child: Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        onChanged: (value) {},
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Enter title of travel',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ),
                SizedBox(height: screenWidth * 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                  child: Text(
                    'Travel date',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: screenWidth * 1.5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewPostItineraryDateSelect()));
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: SizeConfig.widthMultiplier * 13,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 3.5),
                      decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: AllShadows().boxShadow()),
                      alignment: Alignment.centerLeft,
                      child: Text('From when to when are you travelling?',
                          style: TextStyle(
                              // color: theme.lightTextColor,
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.widthMultiplier * 3.6))),
                ),
                SizedBox(height: screenWidth * 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
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
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                  child: Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        onChanged: (value) {},
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                  child: Text(
                    'Travel keywords',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: screenWidth * 3.8,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: screenWidth * 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                  child: Neumorphic(
                      style: AllShadows().neumorphicShadow(screenWidth),
                      child: TextField(
                        onChanged: (value) {},
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: screenWidth * 3.6,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Set keywords using #tags',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: screenWidth * 3.6,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ),
                SizedBox(
                  height: screenWidth * 20,
                ),
                button(screenWidth, provData),
                SizedBox(
                  height: screenWidth * 3,
                ),
              ],
            ),
          ),
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: popNavigation(context, screenWidth),
      title: Text(
        'New post',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
    );
  }

  Widget button(screenWidth, StateSettingProvider provdata) {
    return Neumorphic(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      style: AllShadows().neumorphicShadow(screenWidth, depth: 2),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddNewPostItineraryTravelPlanning()));
        },
        child: Container(
          height: screenWidth * 13,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.mainColor,
          ),
          child: Text(
            'Scheduling',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: screenWidth * 3.8),
          ),
        ),
      ),
    );
  }
}
