import 'package:flutter/material.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/theme/colors.dart';

AppBar appBar(context, screenWidth, title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    leading: popNavigation(context, screenWidth),
    title: Text(
      title,
      style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
    ),
    actions: [
      TextButton(
          onPressed: () {},
          child: Icon(
            Icons.more_horiz,
            color: theme.darkTextColor,
            size: screenWidth * 5,
          ))
    ],
  );
}
