import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/add_new_post_cost.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/add_new_post_itinerary_details.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/add_new_post_itinerary.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostPhoto/addNewPostPhotoDetails/add_new_post_photo_details.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostPhoto/add_new_post_photo.dart';
import 'package:meeps/theme/colors.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({Key? key}) : super(key: key);

  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  bool photoSelected = true;
  bool itinerarySelected = false;
  bool costSelected = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          extendBodyBehindAppBar: true,
          appBar: appBar(context, screenWidth),
          body: Stack(
            children: [
              photoSelected
                  ? AddNewPostPhoto()
                  : itinerarySelected
                      ? AddNewPostItinerary()
                      : AddNewPostCost(),
              photoItineraryCostBlock(screenWidth)
            ],
          )),
    );
  }

  AppBar appBar(context, screenWidth) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 3),
              bottomRight: Radius.circular(screenWidth * 3))),
      backgroundColor:
          itinerarySelected ? Colors.transparent : theme.appBackgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: popNavigation(context, screenWidth),
      title: Text(
        costSelected ? 'Travel Cost Calculation' : 'New post',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
      actions: [
        costSelected
            ? SizedBox()
            : TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => photoSelected
                          ? AddNewPostPhotoDetails()
                          : AddNewPostItineraryDetails()));
                },
                child: Text('Next',
                    style: TextStyle(
                        color: theme.mainColor, fontSize: screenWidth * 4)),
              )
      ],
    );
  }

  Widget photoItineraryCostBlock(screenWidth) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: screenWidth * 7),
          height: screenWidth * 12,
          width: screenWidth * 70,
          decoration: BoxDecoration(
            boxShadow: photoSelected
                ? [BoxShadow(color: Colors.grey)]
                : AllShadows().boxShadow(),
            borderRadius: BorderRadius.circular(screenWidth * 100),
            color: theme.appBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      photoSelected = true;
                      itinerarySelected = false;
                      costSelected = false;
                    });
                  },
                  child: Container(
                    color: theme.appBackgroundColor!.withOpacity(0),
                    child: Center(
                      child: Text(
                        'Photo',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: photoSelected
                                ? theme.mainColor
                                : theme.lightTextColor,
                            fontSize: screenWidth * 3.7),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      photoSelected = false;
                      itinerarySelected = true;
                      costSelected = false;
                    });
                  },
                  child: Container(
                    color: theme.appBackgroundColor!.withOpacity(0),
                    child: Center(
                      child: Text(
                        'Itinerary',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: itinerarySelected
                                ? theme.mainColor
                                : theme.lightTextColor,
                            fontSize: screenWidth * 3.7),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      photoSelected = false;
                      itinerarySelected = false;
                      costSelected = true;
                    });
                  },
                  child: Container(
                    color: theme.appBackgroundColor!.withOpacity(0),
                    child: Center(
                      child: Text(
                        'Cost',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: costSelected
                                ? theme.mainColor
                                : theme.lightTextColor,
                            fontSize: screenWidth * 3.7),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
