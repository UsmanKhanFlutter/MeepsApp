import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/app_bar.dart';
import 'package:meeps/theme/colors.dart';

class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth, 'Hotel'),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        intensity: 1,
                        shadowDarkColor: Colors.grey.shade300,
                        shadowLightColor: Colors.white,

                        // oppositeShadowLightSource: true,
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: SizeConfig.widthMultiplier * 3.5,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/search_icon_colored.png',
                            width: SizeConfig.widthMultiplier * 4,
                            height: SizeConfig.widthMultiplier * 4,
                          ),
                          prefixIconConstraints: BoxConstraints(
                              minWidth: SizeConfig.widthMultiplier * 10),
                          filled: true,
                          fillColor: theme.simpleButtonColor,
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: SizeConfig.widthMultiplier * 3.5,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: SizeConfig.widthMultiplier * 13,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 3.5),
                        decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.grey.shade300),
                            BoxShadow(
                                offset: const Offset(-2, -2),
                                blurRadius: 3,
                                spreadRadius: 1,
                                color: Colors.white70),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text('12.01.2021(Wed)~15.01.2021(Fri)',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: SizeConfig.widthMultiplier * 13,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 3.5),
                        decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.grey.shade300),
                            BoxShadow(
                                offset: const Offset(-2, -2),
                                blurRadius: 3,
                                spreadRadius: 1,
                                color: Colors.white70),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text('2 adults,no children',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3))),
                    SizedBox(
                      height: 40,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                          depth: 2,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey.shade200),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //         SignupWithEmailPassswordProfileSettings()));
                        },
                        child: Container(
                          height: SizeConfig.widthMultiplier * 13,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.coloredButtonColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 3),
                                  blurRadius: 6,
                                  spreadRadius: 3,
                                  color: Colors.grey.shade200),
                            ],
                          ),
                          child: Text(
                            'Search hotel',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: SizeConfig.widthMultiplier * 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar()
        ],
      ),
    ));
  }
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////Widgets/////////////////////////////////
  ///////////////////////////////////////////////////////////////////

}
