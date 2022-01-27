import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddNewPostItineraryDateSelect extends StatefulWidget {
  const AddNewPostItineraryDateSelect({Key? key}) : super(key: key);

  @override
  _AddNewPostItineraryDateSelectState createState() =>
      _AddNewPostItineraryDateSelectState();
}

class _AddNewPostItineraryDateSelectState
    extends State<AddNewPostItineraryDateSelect> {
  DateTime? _startDay;
  DateTime? _endDay;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.appBackgroundColor,
            appBar: simpleAppBar(context, 'Choose a date', screenWidth),
            body: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 4, screenWidth * 4,
                  screenWidth * 4, screenWidth * 3),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .72,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 2),
                      decoration: BoxDecoration(
                          color: theme.appBackgroundColor,
                          borderRadius: BorderRadius.circular(screenWidth * 3),
                          boxShadow: AllShadows().boxShadow()),
                      child: SfDateRangePicker(
                        selectionShape: DateRangePickerSelectionShape.circle,
                        headerStyle: DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w600)),
                        headerHeight: 50,
                        monthViewSettings: DateRangePickerMonthViewSettings(
                            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: theme.lightTextColor,
                                    fontWeight: FontWeight.w500)),
                            enableSwipeSelection: false),
                        enableMultiView: true,
                        navigationDirection:
                            DateRangePickerNavigationDirection.vertical,
                        selectionMode: DateRangePickerSelectionMode.range,

                        initialSelectedRange: PickerDateRange(DateTime.now(),
                            DateTime.now().add(const Duration(days: 30))),
                        selectionColor: theme.mainColor,
                        todayHighlightColor: theme.mainColor,
                        startRangeSelectionColor: theme.mainColor,
                        rangeTextStyle: TextStyle(color: theme.lightTextColor),
                        endRangeSelectionColor: theme.mainColor,
                        // initialDisplayDate: DateTime(2015),
                        // minDate: DateTime(2015),
                        // maxDate: DateTime(2025),
                        rangeSelectionColor: theme.mainColor!.withOpacity(.1),

                        // initialSelectedRanges: [PickerDateRange(_startDay, _endDay)],
                        // initialSelectedRange:
                        //     PickerDateRange(DateTime(2021), DateTime(2022)),
                      ),
                    ),
                    Neumorphic(
                      style:
                          AllShadows().neumorphicShadow(screenWidth, depth: 2),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
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
                            'Complete',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: SizeConfig.widthMultiplier * 4,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            )));
  }
}
