import 'package:flutter/material.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/homeContent/luckySeven/lucky_seven.dart';
import 'package:meeps/theme/colors.dart';

Widget popularTravelList(context, screenWidth) {
  return Container(
    height: screenWidth * 55,
    width: double.infinity,
    child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LuckySeven()));
            },
            child: SizedBox(
              height: screenWidth * 53,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: screenWidth * 80,
                      margin: EdgeInsets.all(screenWidth * 2),
                      padding: EdgeInsets.all(screenWidth * 3),
                      decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                        borderRadius: BorderRadius.circular(screenWidth * 3),
                        boxShadow: AllShadows().boxShadow(),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenWidth * 2),
                                        child: Text(
                                            'Jeju Island in August Honeymoon 7 nights 8 days!! I went on only a budget of 150,000 won :)',
                                            style: TextStyle(
                                                color: theme.lightTextColor,
                                                fontSize: screenWidth * 3)),
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(screenWidth),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/shape.png'))),
                                    ))
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(screenWidth * 1.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 2),
                                    decoration: BoxDecoration(
                                      boxShadow: AllShadows().boxShadow(
                                        darkBlurRadius: 3,
                                        darkSpreadRadius: 0,
                                      ),
                                      color: theme.appBackgroundColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text('93km, 45 visits',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontSize: screenWidth * 2.4)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 2),
                                    decoration: BoxDecoration(
                                      boxShadow: AllShadows().boxShadow(
                                        darkBlurRadius: 3,
                                        darkSpreadRadius: 0,
                                      ),
                                      color: theme.appBackgroundColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text('jej,s korea',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontSize: screenWidth * 2.4)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 2),
                                    decoration: BoxDecoration(
                                      boxShadow: AllShadows().boxShadow(
                                        darkBlurRadius: 3,
                                        darkSpreadRadius: 0,
                                      ),
                                      color: theme.appBackgroundColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text('jeju destination',
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontSize: screenWidth * 2.4)),
                                  ),
                                ]),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenWidth * 8.3,
                    width: screenWidth * 80,
                    padding: EdgeInsets.only(bottom: screenWidth * .6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                            height: screenWidth * 8,
                            width: screenWidth * 8,
                            padding: EdgeInsets.all(screenWidth * .8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    color: Colors.grey.shade400),
                                BoxShadow(
                                    offset: Offset(-2, -2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    color: Colors.white70),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          "assets/face_icons/female3.jpg"))),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 1.7,
                          ),
                          Text('Lucky_seven',
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenWidth * 2.9))
                        ]),
                        Row(
                          children: [
                            Row(children: [
                              Image.asset(
                                'assets/heart_colored.png',
                                width: screenWidth * 4.5,
                                height: screenWidth * 4.5,
                              ),
                              SizedBox(
                                width: screenWidth * 1.3,
                              ),
                              Text('2728',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 3))
                            ]),
                            SizedBox(
                              width: screenWidth * 2.8,
                            ),
                            Row(children: [
                              Image.asset(
                                'assets/bottom_navigation_icons/chat.png',
                                width: screenWidth * 4.5,
                                height: screenWidth * 4.5,
                              ),
                              SizedBox(
                                width: screenWidth * 1.3,
                              ),
                              Text('999',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 3))
                            ]),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
  );
}
