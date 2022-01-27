import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/airplaneTicket/topButtons/multiStop/multi_stop.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/airplaneTicket/topButtons/oneWay/one_way.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/airplaneTicket/topButtons/roundTrip/round_trip.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/app_bar.dart';
import 'package:meeps/theme/colors.dart';

class AirplaneTicket extends StatefulWidget {
  const AirplaneTicket({Key? key}) : super(key: key);

  @override
  _AirplaneTicketState createState() => _AirplaneTicketState();
}

class _AirplaneTicketState extends State<AirplaneTicket> {
  bool roundTripSelected = true;
  bool oneWaySelected = false;
  bool multiStopSelected = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.appBackgroundColor,
      appBar: appBar(context, screenWidth, 'Airplane ticket'),
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
                    topBlock(),
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

  Widget topBlock() {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: SizeConfig.widthMultiplier * 35,
            child: Column(
              children: [
                Expanded(
                    child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              roundTripSelected = true;
                              oneWaySelected = false;
                              multiStopSelected = false;
                            });
                          },
                          child: Container(
                            margin: roundTripSelected
                                ? EdgeInsets.fromLTRB(0, 5, 5, 0)
                                : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius: roundTripSelected
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.circular(13))
                                  : BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.grey.shade300),
                                BoxShadow(
                                    offset: const Offset(-1, -1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.white70),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Round trip',
                              style: TextStyle(
                                  color: theme.mainColor,
                                  fontSize: SizeConfig.widthMultiplier * 3.1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              roundTripSelected = false;
                              oneWaySelected = true;
                              multiStopSelected = false;
                            });
                          },
                          child: Container(
                            margin: oneWaySelected
                                ? EdgeInsets.fromLTRB(5, 5, 5, 0)
                                : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius: oneWaySelected
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.circular(13))
                                  : BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.grey.shade300),
                                BoxShadow(
                                    offset: const Offset(-1, -1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.white70),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'One way',
                              style: TextStyle(
                                  color: theme.mainColor,
                                  fontSize: SizeConfig.widthMultiplier * 3.1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              roundTripSelected = false;
                              oneWaySelected = false;
                              multiStopSelected = true;
                            });
                          },
                          child: Container(
                            margin: multiStopSelected
                                ? EdgeInsets.fromLTRB(5, 5, 0, 0)
                                : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              borderRadius: multiStopSelected
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.circular(13))
                                  : BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.grey.shade300),
                                BoxShadow(
                                    offset: const Offset(-1, -1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.white70),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Multi-stop',
                              style: TextStyle(
                                  color: theme.mainColor,
                                  fontSize: SizeConfig.widthMultiplier * 3.1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                            topLeft:
                                Radius.circular(roundTripSelected ? 0 : 13),
                            topRight:
                                Radius.circular(multiStopSelected ? 0 : 13)),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(3, 3),
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey.shade300),
                          BoxShadow(
                              offset: const Offset(-1, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.white60),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (multiStopSelected) SizedBox(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ICN',
                                  style: TextStyle(
                                      color: theme.darkTextColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          SizeConfig.widthMultiplier * 7)),
                              Text('Seoul',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.widthMultiplier * 3))
                            ],
                          ),
                          if (multiStopSelected) SizedBox(),
                          Container(
                            height: SizeConfig.widthMultiplier * 12,
                            width: SizeConfig.widthMultiplier * 12,
                            decoration: BoxDecoration(
                              color: theme.appBackgroundColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(2, 2),
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    color: Colors.grey.shade300),
                                BoxShadow(
                                    offset: const Offset(-2, -2),
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    color: Colors.white70),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/double_arrow.png',
                              width: SizeConfig.widthMultiplier * 5,
                              height: SizeConfig.widthMultiplier * 5,
                            ),
                          ),
                          if (multiStopSelected) SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Arrival',
                                      style: TextStyle(
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 7)),
                                  Text('Name of city',
                                      style: TextStyle(
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 3))
                                ],
                              ),
                              !multiStopSelected
                                  ? SizedBox()
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.widthMultiplier * 3),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('12:01',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig
                                                          .widthMultiplier *
                                                      2.6)),
                                          Text('Wed',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig
                                                          .widthMultiplier *
                                                      2.6))
                                        ],
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )),
        SizedBox(
          height: 20,
        ),
        roundTripSelected
            ? RoundTrip()
            : oneWaySelected
                ? OneWay()
                : multiStopSelected
                    ? MultiStop()
                    : SizedBox(),
      ],
    );
  }
}
