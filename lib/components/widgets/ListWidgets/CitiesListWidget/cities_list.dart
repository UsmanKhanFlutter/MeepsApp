import 'package:flutter/material.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

Widget citiesList(screenWidth) {
  return SizedBox(
    height: screenWidth * 27,
    width: double.infinity,
    child: ListView.builder(
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
                margin: EdgeInsets.symmetric(vertical: screenWidth * 1.5)
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
                          image: AssetImage('assets/orange_pic.png'))),
                ),
              ),
              SizedBox(
                height: screenWidth,
              ),
              Text('jeju island',
                  style: TextStyle(
                      color: theme.darkTextColor,
                      fontSize: screenWidth * 2.8,
                      fontWeight: FontWeight.w400))
            ],
          );
        }),
  );
}
