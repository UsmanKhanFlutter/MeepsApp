import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AllShadows {
  NeumorphicStyle neumorphicShadow(screenWidth,
      {int depth = -2, double radius = 2}) {
    return NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(screenWidth * radius)),
        depth: double.parse(depth.toString()),
        lightSource: LightSource.topLeft,
        intensity: 1,
        shadowDarkColorEmboss: Colors.grey.shade300,
        // oppositeShadowLightSource: true,
        shadowLightColorEmboss: Colors.white);
  }

  List<BoxShadow> boxShadow(
      {darkBlurRadius = 4,
      darkSpreadRadius = 1,
      lightBlurRadius = 3,
      lightSpreadRadius = 1}) {
    return [
      BoxShadow(
          offset: const Offset(3, 3),
          blurRadius: double.parse(darkBlurRadius.toString()),
          spreadRadius: double.parse(darkSpreadRadius.toString()),
          color: Colors.grey.shade300),
      BoxShadow(
          offset: const Offset(-3, -3),
          blurRadius: double.parse(lightBlurRadius.toString()),
          spreadRadius: double.parse(lightSpreadRadius.toString()),
          color: Colors.white70),
    ];
  }
}
