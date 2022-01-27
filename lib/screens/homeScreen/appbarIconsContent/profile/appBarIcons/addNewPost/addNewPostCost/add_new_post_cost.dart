import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostDateSelect/add_new_post_cost_date_select.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/add_new_post_cost_travel_planning.dart';
import 'package:meeps/theme/colors.dart';

class AddNewPostCost extends StatefulWidget {
  const AddNewPostCost({Key? key}) : super(key: key);

  @override
  _AddNewPostCostState createState() => _AddNewPostCostState();
}

class _AddNewPostCostState extends State<AddNewPostCost> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 20),
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
                    hintText: 'Enter title',
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
                  builder: (context) => AddNewPostCostDateSelect()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                height: screenWidth * 13,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 3.5),
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
                        fontSize: screenWidth * 3.6))),
          ),
          SizedBox(height: screenWidth * 6),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewPostCostTravelPlanning()));
            },
            child: Container(
              height: screenWidth * 13,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: AllShadows().boxShadow(),
                  color: theme.mainColor,
                  borderRadius: BorderRadius.circular(screenWidth * 2)),
              child: Text(
                'Calculate the cost',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: screenWidth * 3.8),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 12),
          circleTotalExpenses(screenWidth),
          SizedBox(height: screenWidth * 26),
        ],
      ),
    );
  }

  Widget circleTotalExpenses(screenWidth) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: screenWidth * 70,
        width: screenWidth * 70,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.appBackgroundColor,
            boxShadow: AllShadows().boxShadow()),
        child: Container(
          alignment: Alignment.center,
          height: screenWidth * 62,
          width: screenWidth * 62,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.appBackgroundColor,
              boxShadow: AllShadows().boxShadow()),
          child: Neumorphic(
            style: AllShadows().neumorphicShadow(screenWidth,
                radius: screenWidth * 200, depth: -4),
            child: Container(
              alignment: Alignment.center,
              height: screenWidth * 43,
              width: screenWidth * 43,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.appBackgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('1,532,590 Won',
                      style: TextStyle(
                          fontSize: screenWidth * 5,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500)),
                  Text('1000 Dollars',
                      style: TextStyle(
                          fontSize: screenWidth * 3.7,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: screenWidth * 3),
                  Text('Total expenditure',
                      style: TextStyle(
                          fontSize: screenWidth * 3,
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
