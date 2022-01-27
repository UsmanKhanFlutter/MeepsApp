import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/airplaneTicket/airplane_ticket.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/carRental/car_rental.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/hotel/hotel.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/tour_or_activity.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provData = Provider.of<StateSettingProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AirplaneTicket()));
                              },
                              child: Container(
                                height: screenWidth * 8,
                                color: theme.appBackgroundColor,
                                child: Center(
                                  child: Text(
                                    'Airline Ticket',
                                    style: TextStyle(
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            SizeConfig.widthMultiplier * 3.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Hotel()));
                              },
                              child: Container(
                                height: screenWidth * 8,
                                color: theme.appBackgroundColor,
                                child: Center(
                                  child: Text(
                                    'Hotel',
                                    style: TextStyle(
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            SizeConfig.widthMultiplier * 3.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TourOrActivity()));
                              },
                              child: Container(
                                height: screenWidth * 8,
                                color: theme.appBackgroundColor,
                                child: Center(
                                  child: Text(
                                    'Tour/activity',
                                    style: TextStyle(
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            SizeConfig.widthMultiplier * 3.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CarRental()));
                              },
                              child: Container(
                                height: screenWidth * 8,
                                color: theme.appBackgroundColor,
                                child: Center(
                                  child: Text(
                                    'Car rental',
                                    style: TextStyle(
                                        color: theme.lightTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            SizeConfig.widthMultiplier * 3.8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                              width: screenWidth * 4,
                              height: screenWidth * 4,
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
                      SizedBox(height: 30),
                      Text('Flight Special Offer!',
                          style: TextStyle(
                              fontSize: 19,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 2),
                      Text('Find the best flight deals now!',
                          style: TextStyle(
                              fontSize: 19,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 10),
                      bestOffers(),
                      SizedBox(height: 30),
                    ],
                  )),
              Text('Airbnb X Meeps',
                  style: TextStyle(
                      fontSize: 19,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 2),
              Text('Discounted packages!',
                  style: TextStyle(
                      fontSize: 16,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              discountedPackages(),
              SizedBox(height: 30),
              Text('Best places to travel these days',
                  style: TextStyle(
                      fontSize: 19,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              bestPlacesToTravelTheseDays(),
              SizedBox(height: 30),
              Text('Popular car rentals',
                  style: TextStyle(
                      fontSize: 19,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              popularcarRentals(),
              SizedBox(height: 30),
              Text('The hottest hotels now',
                  style: TextStyle(
                      fontSize: 19,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              theHottestHotelsNow(),
              SizedBox(height: 150)
            ],
          ),
        ),
      ),
    );
  }

  Widget bestOffers() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      height: SizeConfig.widthMultiplier * 40,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 6,
            spreadRadius: 3,
            color: Colors.grey.shade200),
      ], borderRadius: BorderRadius.circular(15), color: theme.mainColor),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Only Meeps!',
                  style: GoogleFonts.ptSans(
                      fontSize: SizeConfig.widthMultiplier * 5,
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Best offers!',
                    style: GoogleFonts.ptSans(
                        fontSize: SizeConfig.widthMultiplier * 7.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/person.png'),
          ))
        ],
      ),
    );
  }

  Widget discountedPackages() {
    return Container(
      height: SizeConfig.widthMultiplier * 55,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                width: SizeConfig.widthMultiplier * 40,
                margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                        color: Colors.grey.shade300),
                    BoxShadow(
                        offset: const Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 1,
                        color: Colors.white70),
                  ],
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/roomm.jpg'))
                ),
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 3),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade400),
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/roomm.jpg'))),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(),
                              Text(
                                  'Travelling around UK with a professional guide',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontSize: SizeConfig.widthMultiplier * 3,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: SizeConfig.widthMultiplier * 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('lucky7+4k',
                                      style: TextStyle(
                                          color: theme.lightTextColor,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 2.3,
                                          fontWeight: FontWeight.w400)),
                                  Text('383,484 won',
                                      style: TextStyle(
                                          color: theme.lightTextColor,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 2.3,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              SizedBox(),
                            ],
                          ))),
                ]));
          }),
    );
  }

  Widget bestPlacesToTravelTheseDays() {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 70,
                  width: 90,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: theme.appBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                          spreadRadius: 1,
                          color: Colors.grey.shade400),
                      const BoxShadow(
                          offset: Offset(-2, -2),
                          blurRadius: 4,
                          spreadRadius: 2,
                          color: Colors.white70),
                    ],
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
                  height: 5,
                ),
                Text('jeju island',
                    style: TextStyle(
                        color: theme.darkTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400))
              ],
            );
          }),
    );
  }

  Widget popularcarRentals() {
    return Container(
      height: SizeConfig.widthMultiplier * 60,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                width: MediaQuery.of(context).size.width * .8,
                margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                        color: Colors.grey.shade300),
                    BoxShadow(
                        offset: const Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 1,
                        color: Colors.white70),
                  ],
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/roomm.jpg'))
                ),
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 3),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade400),
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/roomm.jpg'))),
                      )),
                  Expanded(
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(),
                              Text('Grand Sterx 12 seater',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontSize:
                                          SizeConfig.widthMultiplier * 3.5,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: SizeConfig.widthMultiplier * 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    SizeConfig.widthMultiplier *
                                                        2.4,
                                                vertical: 3),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: const Offset(1, 1),
                                                    spreadRadius: 1,
                                                    color:
                                                        Colors.grey.shade400),
                                                const BoxShadow(
                                                    offset: Offset(-2, -2),
                                                    blurRadius: 4,
                                                    spreadRadius: 2,
                                                    color: Colors.white70),
                                              ],
                                              color: theme.appBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Text('Diesel',
                                                style: TextStyle(
                                                    color: theme.darkTextColor
                                                        ?.withOpacity(.8),
                                                    fontSize: SizeConfig
                                                            .widthMultiplier *
                                                        2.4)),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    SizeConfig.widthMultiplier *
                                                        2.4,
                                                vertical: 3),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: const Offset(1, 1),
                                                    spreadRadius: 1,
                                                    color:
                                                        Colors.grey.shade400),
                                                const BoxShadow(
                                                    offset: Offset(-2, -2),
                                                    blurRadius: 4,
                                                    spreadRadius: 2,
                                                    color: Colors.white70),
                                              ],
                                              color: theme.appBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Text('2013-15',
                                                style: TextStyle(
                                                    color: theme.darkTextColor
                                                        ?.withOpacity(.8),
                                                    fontSize: SizeConfig
                                                            .widthMultiplier *
                                                        2.4)),
                                          ),
                                          SizedBox()
                                        ]),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text('General insurance ',
                                          style: TextStyle(
                                              color: theme.lightTextColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      2.5,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text('383,484 won',
                                          style: TextStyle(
                                              color: theme.mainColor,
                                              fontSize:
                                                  SizeConfig.widthMultiplier *
                                                      3.6,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(),
                            ],
                          ))),
                ]));
          }),
    );
  }

  Widget theHottestHotelsNow() {
    return Container(
      height: SizeConfig.widthMultiplier * 60,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                width: MediaQuery.of(context).size.width * .8,
                margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                        color: Colors.grey.shade300),
                    BoxShadow(
                        offset: const Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 1,
                        color: Colors.white70),
                  ],
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/roomm.jpg'))
                ),
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 3),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade400),
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/roomm.jpg'))),
                      )),
                  Expanded(
                      child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nine Tree Premier Hotel Myeongdong',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontSize: SizeConfig.widthMultiplier * 3.5,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: SizeConfig.widthMultiplier * .2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('1.5km from city centre 4 stars',
                                      style: TextStyle(
                                          color: theme.lightTextColor,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 2.7,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                      height: SizeConfig.widthMultiplier * 2.7,
                                      child: Image.asset(
                                          'assets/booking_icon.png')),
                                ]),
                          ],
                        ),
                        SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(' 1.5 - 456 ratings',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontSize: SizeConfig.widthMultiplier * 2.2,
                                    fontWeight: FontWeight.w400)),
                            Text('383,484 won',
                                style: TextStyle(
                                    color: theme.mainColor,
                                    fontSize: SizeConfig.widthMultiplier * 3.6,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(),
                      ],
                    ),
                  ))
                ]));
          }),
    );
  }
}
