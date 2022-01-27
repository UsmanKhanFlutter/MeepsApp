import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/airplaneTicket/dateSelect/date_select.dart';
import 'package:meeps/theme/colors.dart';

class OneWay extends StatefulWidget {
  @override
  State<OneWay> createState() => _OneWayState();
}

class _OneWayState extends State<OneWay> {
  bool showExpandedSelectionBlock = false;
  int numberOfAdults = 1;
  int numberOfChildren = 3;
  int numberOfBabies = 2;
  String luxuryClassName = 'economy';
  List<dynamic> luxuryOptions = [
    {'name': 'Economy', 'selected': true},
    {'name': 'Premium economy', 'selected': false},
    {'name': 'Business', 'selected': false},
    {'name': 'First', 'selected': false}
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DateSelect()));
          },
          child: Container(
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
              child: Text('12.01.2021(Wed)',
                  style: TextStyle(
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.widthMultiplier * 3.3))),
        ),
        SizedBox(
          height: 20,
        ),
        personAndLuxurySelectionBlock(screenWidth),
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
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: SizeConfig.widthMultiplier * 4,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  personAndLuxurySelectionBlock(screenWidth) {
    return Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3.5),
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AllShadows().boxShadow(),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * 4.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    numberOfAdults == 0
                        ? SizedBox()
                        : Text('$numberOfAdults adult',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3)),
                    numberOfChildren > 0 && numberOfAdults > 0
                        ? Text(',',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3))
                        : SizedBox(),
                    numberOfChildren == 0
                        ? SizedBox()
                        : Text('$numberOfChildren children',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3)),
                    numberOfChildren > 0 && numberOfBabies > 0 ||
                            numberOfAdults > 0
                        ? Text(',',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3))
                        : SizedBox(),
                    numberOfBabies == 0
                        ? SizedBox()
                        : Text('$numberOfBabies babies',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3)),
                    numberOfBabies > 0 && luxuryClassName.isNotEmpty
                        ? Text(',',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3))
                        : SizedBox(),
                    luxuryClassName.isEmpty
                        ? SizedBox()
                        : Text(luxuryClassName.toLowerCase(),
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 3.3))
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showExpandedSelectionBlock = !showExpandedSelectionBlock;
                    });
                  },
                  child: Row(children: [
                    Container(
                      height: SizeConfig.widthMultiplier * 4.5,
                      width: SizeConfig.widthMultiplier * 4.5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: showExpandedSelectionBlock
                            ? theme.mainColor
                            : theme.appBackgroundColor,
                        boxShadow: AllShadows().boxShadow(),
                      ),
                      child: Icon(
                        Icons.done,
                        color: showExpandedSelectionBlock
                            ? Colors.white
                            : theme.darkTextColor,
                        size: SizeConfig.widthMultiplier * 3.3,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 1.5,
                    ),
                    Text('Direct',
                        style: TextStyle(
                            color: theme.lightTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.widthMultiplier * 3.3)),
                  ]),
                )
              ],
            ),
            SizedBox(
              height: screenWidth * 4.8,
            ),
            !showExpandedSelectionBlock
                ? SizedBox()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenWidth * 12,
                            width: screenWidth * 37,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 3),
                                color: theme.appBackgroundColor,
                                boxShadow: AllShadows().boxShadow()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (numberOfAdults == 0) {
                                        numberOfAdults = 0;
                                      } else {
                                        numberOfAdults = numberOfAdults - 1;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: numberOfAdults == 0
                                        ? theme.lightTextColor!.withOpacity(.7)
                                        : theme.mainColor,
                                    size: screenWidth * 6,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$numberOfAdults Adult',
                                        style: TextStyle(
                                            color: numberOfAdults == 0
                                                ? theme.lightTextColor!
                                                    .withOpacity(.7)
                                                : theme.mainColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.3)),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text('From 12 years',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier * 2))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      numberOfAdults = numberOfAdults + 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: numberOfAdults == 0
                                        ? theme.lightTextColor!.withOpacity(.7)
                                        : theme.mainColor,
                                    size: screenWidth * 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenWidth * 4.8,
                          ),
                          Container(
                            height: screenWidth * 12,
                            width: screenWidth * 37,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 3),
                                color: theme.appBackgroundColor,
                                boxShadow: AllShadows().boxShadow()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (numberOfChildren == 0) {
                                        numberOfChildren = 0;
                                      } else {
                                        numberOfChildren = numberOfChildren - 1;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: numberOfChildren == 0
                                        ? theme.lightTextColor!.withOpacity(.7)
                                        : theme.mainColor,
                                    size: screenWidth * 6,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$numberOfChildren Children',
                                        style: TextStyle(
                                            color: numberOfChildren == 0
                                                ? theme.lightTextColor!
                                                    .withOpacity(.7)
                                                : theme.mainColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.3)),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text('Under 12 years',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier * 2))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      numberOfChildren = numberOfChildren + 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: numberOfChildren == 0
                                        ? theme.lightTextColor!.withOpacity(.7)
                                        : theme.mainColor,
                                    size: screenWidth * 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenWidth * 4.8,
                          ),
                          Container(
                            height: screenWidth * 12,
                            width: screenWidth * 37,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 3),
                                color: theme.appBackgroundColor,
                                boxShadow: AllShadows().boxShadow()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (numberOfBabies == 0) {
                                        numberOfBabies = 0;
                                      } else {
                                        numberOfBabies = numberOfBabies - 1;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: numberOfBabies == 0
                                        ? theme.lightTextColor!.withOpacity(.7)
                                        : theme.mainColor,
                                    size: screenWidth * 6,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('$numberOfBabies Babies',
                                        style: TextStyle(
                                            color: numberOfBabies == 0
                                                ? theme.lightTextColor!
                                                    .withOpacity(.7)
                                                : theme.mainColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                SizeConfig.widthMultiplier *
                                                    3.3)),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text('Up to 2 years',
                                        style: TextStyle(
                                            color: theme.lightTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                SizeConfig.widthMultiplier * 2))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      numberOfBabies = numberOfBabies + 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: numberOfBabies == 0
                                        ? theme.lightTextColor!.withOpacity(.7)
                                        : theme.mainColor,
                                    size: screenWidth * 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenWidth * 4.8,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < luxuryOptions.length; i++)
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      luxuryOptions[i]['selected'] =
                                          !luxuryOptions[i]['selected'];
                                      if (luxuryOptions[i]['selected']) {
                                        luxuryClassName =
                                            luxuryOptions[i]['name'];
                                      } else {
                                        luxuryClassName = '';
                                      }

                                      luxuryOptions.forEach((element) {
                                        if (element['name'] ==
                                            luxuryOptions[i]['name']) {
                                        } else {
                                          element['selected'] = false;
                                        }
                                      });
                                    });
                                  },
                                  child: Container(
                                      height: screenWidth * 12,
                                      width: screenWidth * 37,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 3),
                                          color: theme.appBackgroundColor,
                                          boxShadow: AllShadows().boxShadow()),
                                      child: Text('${luxuryOptions[i]['name']}',
                                          style: TextStyle(
                                              color: luxuryOptions[i]
                                                      ['selected']
                                                  ? theme.mainColor
                                                  : theme.lightTextColor!
                                                      .withOpacity(.7),
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      3.3))),
                                ),
                                SizedBox(
                                  height: screenWidth * 4.8,
                                ),
                              ],
                            )
                        ],
                      )
                    ],
                  )
          ],
        ));
  }
}
