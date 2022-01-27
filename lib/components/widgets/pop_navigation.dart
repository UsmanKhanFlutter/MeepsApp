import 'package:flutter/material.dart';
import 'package:meeps/theme/colors.dart';

Widget popNavigation(context, screenWidth) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Container(
      color: theme.appBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 5.3),
        child: Image.asset(
          'assets/arrow_back.png',
          color: theme.darkTextColor,
        ),
      ),
    ),
  );
}
