import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CarRentalFilter extends StatefulWidget {
  @override
  _CarRentalFilterState createState() => _CarRentalFilterState();
}

class _CarRentalFilterState extends State<CarRentalFilter> {
  double rangeStart = 2012;
  double rangeEnd = 2022;
  List<dynamic> typeList = [
    {'name': 'Compact', 'selected': true},
    {'name': 'Small', 'selected': false},
    {'name': 'Small-Mid', 'selected': false},
    {'name': 'Midsize', 'selected': false},
    {'name': 'Luxury', 'selected': false},
    {'name': 'RV/SUV', 'selected': false},
    {'name': 'Van', 'selected': false},
  ];
  List<dynamic> insuranceList = [
    {'name': 'CDW+TPL', 'description': '', 'selected': true},
    {
      'name': 'CDW+TPL+  ',
      'description':
          'Coverage is high, and compensation is low in case of an accident.',
      'selected': false
    },
    {
      'name': 'CDW+TPL++',
      'description':
          'There are no insurance limits and no compensation in case of an accident.',
      'selected': false
    },
  ];
  List<dynamic> fuelList = [
    {'name': 'Gasoline', 'description': '', 'selected': true},
    {'name': 'Diesel', 'selected': false},
    {'name': 'LPG', 'selected': false},
    {'name': 'Hybrid', 'selected': false},
    {'name': 'Electric', 'selected': false},
  ];

  List<dynamic> brandList = [
    {'name': 'Hyundai', 'selected': true},
    {'name': 'Kia', 'selected': false},
    {'name': 'Renault Samsung', 'selected': false},
    {'name': 'Ssangyong', 'selected': false},
    {'name': 'GM', 'selected': false},
    {'name': 'Foreign', 'selected': false}
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: !provData.showCarRentalFilter
          ? SizedBox()
          : Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                if (direction == DismissDirection.down) {
                  provData.showCarRentalFilter = false;
                  setState(() {});
                }

                // if (!provData.showCarRentalFilter) {

                // }

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => homepage()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 4, screenWidth * 5, screenWidth * 4, 0),
                height: MediaQuery.of(context).size.height * .8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 8),
                      topRight: Radius.circular(screenWidth * 8)),
                  boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                                height: screenWidth * .5,
                                width: screenWidth * 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:
                                        theme.lightTextColor?.withOpacity(.6))),
                            SizedBox(
                              height: screenWidth * 2,
                            ),
                            Text('Filter',
                                style: TextStyle(
                                    fontSize: screenWidth * 4.3,
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 8,
                      ),
                      Text('Type',
                          style: TextStyle(
                              fontSize: screenWidth * 3.9,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      type(screenWidth),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      Text('Insurance',
                          style: TextStyle(
                              fontSize: screenWidth * 3.9,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      insurance(screenWidth),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      Text('Fuel',
                          style: TextStyle(
                              fontSize: screenWidth * 3.9,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      fuel(screenWidth),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      Text('Year',
                          style: TextStyle(
                              fontSize: screenWidth * 3.9,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      year(screenWidth),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      Text('Brand',
                          style: TextStyle(
                              fontSize: screenWidth * 3.9,
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      brand(screenWidth),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      buttons(screenWidth),
                      SizedBox(
                        height: screenWidth * 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget type(screenWidth) {
    return Wrap(
      children: [
        for (int i = 0; i < typeList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    typeList[i]['selected'] = true;
                    typeList.forEach((element) {
                      if (element['name'] == typeList[i]['name']) {
                      } else {
                        element['selected'] = false;
                      }
                    });
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(screenWidth * 2.2),
                    margin: EdgeInsets.only(
                        right: screenWidth * 3, bottom: screenWidth * 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 1.8),
                      color: typeList[i]['selected']
                          ? theme.mainColor
                          : theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(typeList[i]['name'],
                            style: TextStyle(
                                color: typeList[i]['selected']
                                    ? Colors.white
                                    : theme.lightTextColor,
                                fontSize: 12)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }

  Widget insurance(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: EdgeInsets.only(bottom: screenWidth * 2),
            child: Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    insuranceList[i]['selected'] =
                        !insuranceList[i]['selected'];
                  });
                },
                child: Container(
                  height: screenWidth * 4.8,
                  width: screenWidth * 4.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: insuranceList[i]['selected']
                        ? theme.mainColor
                        : theme.appBackgroundColor,
                    boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                  ),
                  child: Icon(
                    Icons.done,
                    color: insuranceList[i]['selected']
                        ? Colors.white
                        : theme.darkTextColor,
                    size: screenWidth * 3.5,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 2,
              ),
              Text(insuranceList[i]['name'],
                  style: TextStyle(
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 3.3)),
              SizedBox(
                width: screenWidth * 2,
              ),
              Flexible(
                child: Text(insuranceList[i]['description'],
                    style: TextStyle(
                        color: theme.lightTextColor?.withOpacity(.7),
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 3)),
              ),
            ]),
          ),
      ],
    );
  }

  Widget fuel(screenWidth) {
    return Wrap(
      children: [
        for (int i = 0; i < fuelList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    fuelList[i]['selected'] = true;
                    fuelList.forEach((element) {
                      if (element['name'] == fuelList[i]['name']) {
                      } else {
                        element['selected'] = false;
                      }
                    });
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(screenWidth * 2.2),
                    margin: EdgeInsets.only(
                        right: screenWidth * 3, bottom: screenWidth * 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 1.8),
                      color: fuelList[i]['selected']
                          ? theme.mainColor
                          : theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(fuelList[i]['name'],
                            style: TextStyle(
                                color: fuelList[i]['selected']
                                    ? Colors.white
                                    : theme.lightTextColor,
                                fontSize: 12)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }

  Widget brand(screenWidth) {
    return Wrap(
      children: [
        for (int i = 0; i < brandList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    brandList[i]['selected'] = true;
                    brandList.forEach((element) {
                      if (element['name'] == brandList[i]['name']) {
                      } else {
                        element['selected'] = false;
                      }
                    });
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(screenWidth * 2.2),
                    margin: EdgeInsets.only(
                        right: screenWidth * 3, bottom: screenWidth * 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 1.8),
                      color: brandList[i]['selected']
                          ? theme.mainColor
                          : theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(brandList[i]['name'],
                            style: TextStyle(
                                color: brandList[i]['selected']
                                    ? Colors.white
                                    : theme.lightTextColor,
                                fontSize: 12)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }

  Widget buttons(screenWidth) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {});
              Provider.of<StateSettingProvider>(context, listen: false)
                  .showCarRentalFilter = false;
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 11,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget year(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 2,
        ),
        Text('${rangeStart.toInt()} ~ ${rangeEnd.toInt()}',
            style: TextStyle(
                fontSize: screenWidth * 3.6,
                color: theme.mainColor,
                fontWeight: FontWeight.w400)),
        SfRangeSlider(
          endThumbIcon: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow()],
                color: theme.appBackgroundColor,
                shape: BoxShape.circle),
            child: Container(
              decoration:
                  BoxDecoration(color: theme.mainColor, shape: BoxShape.circle),
              margin: EdgeInsets.all(3),
            ),
          ),
          min: 2012,
          max: 2022,
          activeColor: theme.mainColor,
          startThumbIcon: Container(
            decoration: BoxDecoration(
                color: theme.appBackgroundColor, shape: BoxShape.circle),
            child: Container(
              decoration:
                  BoxDecoration(color: theme.mainColor, shape: BoxShape.circle),
              margin: EdgeInsets.all(3),
            ),
          ),
          values: SfRangeValues(rangeStart, rangeEnd),
          onChanged: (value) {
            setState(() {
              rangeStart = value.start;
              rangeEnd = value.end;
            });
          },
        ),
      ],
    );
    // return SliderTheme(
    //   data: SliderThemeData(
    //     trackHeight: 2,
    //   ),
    //   child: RangeSlider(
    //     activeColor: theme.mainColor,
    //     min: 2015,
    //     max: 2025,
    //     values: RangeValues(rangeStart, rangeEnd),
    //     onChanged: (value) {
    //       setState(() {
    //         rangeStart = value.start;
    //         rangeEnd = value.end;
    //       });
    //     },
    //   ),
    // );
  }
}
