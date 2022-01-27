import 'package:flutter/material.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/theme/colors.dart';

AppBar simpleAppBar(context, titleText, screenWidth) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    leading: popNavigation(context, screenWidth),
    title: Text(
      titleText,
      style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
    ),
  );
}
