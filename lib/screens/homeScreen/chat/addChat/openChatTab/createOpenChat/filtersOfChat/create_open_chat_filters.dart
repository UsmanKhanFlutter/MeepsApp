import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/screens/homeScreen/chat/addChat/openChatTab/createOpenChat/pictureOfChat/create_open_chat_picture.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CreateOpenChatFilters extends StatefulWidget {
  @override
  State<CreateOpenChatFilters> createState() => _CreateOpenChatFiltersState();
}

class _CreateOpenChatFiltersState extends State<CreateOpenChatFilters> {
  List<dynamic> weeksList = [
    {'name': '1 week', 'selected': true},
    {'name': '2 weeks', 'selected': false},
    {'name': '3 weeks', 'selected': false},
    {'name': '4 weeks', 'selected': false}
  ];
  double rangeStart = 0;
  double rangeEnd = 100;
  double singleSlidevalue = 0;
  bool isLocationEnabled = false;

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Add chat', screenWidth),
        body: Container(
          padding: EdgeInsets.all(screenWidth * 4),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 6, horizontal: screenWidth * 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(),
                      borderRadius: BorderRadius.circular(screenWidth * 3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenWidth * 3),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Please set the default value\nfor the chat room.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.4,
                                color: theme.mainColor,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.widthMultiplier * 4.6),
                          ),
                        ),
                        SizedBox(height: screenWidth * 10),
                        Text(
                          'Chat room retention period',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                        SizedBox(height: screenWidth * 3),
                        weeksNamesList(screenWidth),
                        SizedBox(height: screenWidth * 2),
                        Text(
                          '(Possible to automatically delete / extend after this period)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: theme.lightTextColor!.withOpacity(.7),
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.widthMultiplier * 3),
                        ),
                        SizedBox(height: screenWidth * 8),
                        Text(
                          'Number of participants',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                        SizedBox(height: screenWidth * 3),
                        numberOfparticipants(screenWidth),
                        SizedBox(height: screenWidth * 5),
                        Text(
                          'Age',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: theme.lightTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.widthMultiplier * 4),
                        ),
                        SizedBox(height: screenWidth * 3),
                        age(screenWidth),
                        SizedBox(height: screenWidth * 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enable location',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeConfig.widthMultiplier * 4),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLocationEnabled = !isLocationEnabled;
                                });
                              },
                              child: Container(
                                  height: screenWidth * 7,
                                  width: screenWidth * 15,
                                  padding: EdgeInsets.fromLTRB(
                                      0, screenWidth * .8, 0, screenWidth * .8),
                                  alignment: isLocationEnabled
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: isLocationEnabled
                                          ? theme.mainColor
                                          : theme.lightTextColor!
                                              .withOpacity(.5),
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 100)),
                                  child: Container(
                                    height: screenWidth * 8,
                                    width: screenWidth * 8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth),
                child: Neumorphic(
                  style: AllShadows().neumorphicShadow(screenWidth, depth: 2),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreateOpenChatPicture()));
                    },
                    child: Container(
                      height: screenWidth * 13,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.mainColor,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: screenWidth * 3.8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget weeksNamesList(screenWidth) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        for (int i = 0; i < weeksList.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    weeksList[i]['selected'] = true;
                    weeksList.forEach((element) {
                      if (element['name'] == weeksList[i]['name']) {
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
                      color: weeksList[i]['selected']
                          ? theme.mainColor
                          : theme.appBackgroundColor,
                      boxShadow: AllShadows().boxShadow(darkSpreadRadius: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(weeksList[i]['name'],
                            style: TextStyle(
                                color: weeksList[i]['selected']
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

  Widget numberOfparticipants(screenWidth) {
    return SfSliderTheme(
      data: SfRangeSliderThemeData(
          tooltipBackgroundColor: Colors.white,
          tooltipTextStyle: TextStyle(
              color: theme.lightTextColor, fontSize: screenWidth * 2.8)),
      child: SfSlider(
        value: singleSlidevalue,
        tooltipShape: SfRectangularTooltipShape(),
        tooltipTextFormatterCallback: (actualValue, formattedText) {
          double d = actualValue;

          return d.toStringAsFixed(0);
        },
        enableTooltip: true,
        min: 0,
        max: 100,
        activeColor: theme.mainColor,
        thumbIcon: Container(
          decoration: BoxDecoration(
              color: theme.appBackgroundColor, shape: BoxShape.circle),
          child: Container(
            decoration:
                BoxDecoration(color: theme.mainColor, shape: BoxShape.circle),
            margin: EdgeInsets.all(3),
          ),
        ),
        onChanged: (value) {
          setState(() {
            singleSlidevalue = value;
          });
        },
      ),
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

  Widget age(screenWidth) {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
          tooltipBackgroundColor: Colors.white,
          tooltipTextStyle: TextStyle(
              color: theme.lightTextColor, fontSize: screenWidth * 2.4)),
      child: SfRangeSlider(
        tooltipShape: SfRectangularTooltipShape(),
        tooltipTextFormatterCallback: (actualValue, formattedText) {
          double d = actualValue;

          return '${d.toStringAsFixed(0)} years old';
        },
        enableTooltip: true,
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
        min: 0,
        max: 100,
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
