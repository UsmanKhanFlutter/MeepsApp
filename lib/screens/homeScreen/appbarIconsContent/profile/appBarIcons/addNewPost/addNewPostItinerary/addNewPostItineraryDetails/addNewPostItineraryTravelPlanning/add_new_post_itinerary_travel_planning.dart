import 'dart:math' as math;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryTravelPlanning/costTab/cost_tab.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryTravelPlanning/costTab/depositPopupBlock/deposit_popup_block.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryTravelPlanning/costTab/expensesPopupBlock/expenses_popup_block.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryTravelPlanning/itineraryTab/itinerary_tab.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../profile.dart';

class AddNewPostItineraryTravelPlanning extends StatefulWidget {
  const AddNewPostItineraryTravelPlanning({Key? key}) : super(key: key);

  @override
  _AddNewPostItineraryTravelPlanningState createState() =>
      _AddNewPostItineraryTravelPlanningState();
}

class _AddNewPostItineraryTravelPlanningState
    extends State<AddNewPostItineraryTravelPlanning>
    with SingleTickerProviderStateMixin {
  AnimationController? rotationController;

  bool itinerarySelected = true;
  bool costSelected = false;
  bool isExpanded = false;
  bool showWritePostAlertBox = false;
  @override
  void initState() {
    rotationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void dispose() {
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: theme.appBackgroundColor,
              appBar: appBar(context, screenWidth),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenWidth * 6,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          child: Text(
                            'Jeju honeymoon + restaurant tour 7 days',
                            style: TextStyle(
                                color: theme.darkTextColor,
                                fontSize: screenWidth * 6,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 3,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          child: Text('08.26.2021 ~ 09.01.2021',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.6,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(height: screenWidth * 4.3),
                        itineraryOrCost(screenWidth),
                        SizedBox(height: screenWidth * 5),
                        itinerarySelected
                            ? ItineraryTab()
                            : costSelected
                                ? CostTab()
                                : SizedBox(),
                        SizedBox(
                          height: screenWidth * 30,
                        ),
                      ],
                    ),
                  ),
                  provData.showExpensesPopup
                      ? ExpensesPopupBlock()
                      : provData.showDepositsPopup
                          ? DepositPopupBlock()
                          : SizedBox()
                ],
              )),
          !showWritePostAlertBox ? SizedBox() : createPostAlertBox(screenWidth),
          !costSelected
              ? SizedBox()
              : AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  bottom: isExpanded ? screenWidth * 42 : screenWidth * 6,
                  right: screenWidth * 7,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                        isExpanded
                            ? rotationController!.forward()
                            : rotationController!.reverse();
                      });
                      Provider.of<StateSettingProvider>(context, listen: false)
                          .showDepositsPopupBlock();
                    },
                    child: Container(
                        height: screenWidth * 13,
                        width: screenWidth * 13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.appBackgroundColor,
                            boxShadow: AllShadows().boxShadow()),
                        child: Text(
                          'Deposit',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: theme.mainColor,
                              fontSize: screenWidth * 2.7),
                        )),
                  )),
          !costSelected
              ? SizedBox()
              : AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  bottom: isExpanded ? screenWidth * 25 : screenWidth * 6,
                  right: screenWidth * 7,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                        isExpanded
                            ? rotationController!.forward()
                            : rotationController!.reverse();
                      });
                      Provider.of<StateSettingProvider>(context, listen: false)
                          .showExpensesPopupBlock();
                    },
                    child: Container(
                        height: screenWidth * 13,
                        width: screenWidth * 13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.appBackgroundColor,
                            boxShadow: AllShadows().boxShadow()),
                        child: Text(
                          'Expense',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: theme.mainColor,
                              fontSize: screenWidth * 2.7),
                        )),
                  )),
          !costSelected
              ? SizedBox()
              : Positioned(
                  bottom: screenWidth * 6,
                  right: screenWidth * 6,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                        isExpanded
                            ? rotationController!.forward()
                            : rotationController!.reverse();
                      });
                    },
                    child: RotationTransition(
                      turns: Tween(begin: 1.0, end: 1.12)
                          .animate(rotationController!),
                      child: Container(
                          height: screenWidth * 15,
                          width: screenWidth * 15,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.mainColor,
                              boxShadow: AllShadows().boxShadow()),
                          child: Icon(Icons.add,
                              color: Colors.white, size: screenWidth * 9)),
                    ),
                  )),
        ],
      ),
    );
  }

  AppBar appBar(context, screenWidth) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 3),
              bottomRight: Radius.circular(screenWidth * 3))),
      backgroundColor: theme.appBackgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: popNavigation(context, screenWidth),
      title: Text(
        'Travel planning',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              showWritePostAlertBox = true;
            });
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => photoSelected
            //         ? AddNewPostPhotoDetails()
            //         : AddNewPostItineraryDetails()));
          },
          child: Text('Done',
              style:
                  TextStyle(color: theme.mainColor, fontSize: screenWidth * 4)),
        )
      ],
    );
  }

  Widget itineraryOrCost(screenWidth) {
    return Container(
      height: screenWidth * 13,
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 1.4),
      margin: EdgeInsets.only(right: screenWidth * 4, left: screenWidth * 4),
      decoration: BoxDecoration(
        color: theme.appBackgroundColor,
        borderRadius: BorderRadius.circular(screenWidth * 3),
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 4,
              spreadRadius: 2,
              color: Colors.grey.shade300),
          BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.white),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: itinerarySelected
                  ? Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            itinerarySelected = true;
                            costSelected = false;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Itinerary',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          itinerarySelected = true;
                          costSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: itinerarySelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Itinerary',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    )),
          Expanded(
              child: costSelected
                  ? Neumorphic(
                      style: NeumorphicStyle(
                          depth: -2,
                          lightSource: LightSource.topLeft,
                          intensity: 1,
                          shadowDarkColorEmboss: Colors.grey.shade300,
                          // oppositeShadowLightSource: true,
                          shadowLightColorEmboss: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            itinerarySelected = false;
                            costSelected = true;
                          });
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(color: theme.appBackgroundColor),
                          alignment: Alignment.center,
                          child: Text('Cost',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.4,
                                  fontWeight: FontWeight.w600,
                                  color: theme.mainColor)),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          itinerarySelected = false;
                          costSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: costSelected
                              ? theme.appBackgroundColor
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text('Cost',
                            style: TextStyle(
                                fontSize: screenWidth * 3.4,
                                fontWeight: FontWeight.w600,
                                color: theme.lightTextColor)),
                      ),
                    ))
        ],
      ),
    );
  }

  Widget createPostAlertBox(screenWidth) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Container(
          height: screenWidth * 32,
          width: screenWidth * 75,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 6, vertical: screenWidth * 4),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(screenWidth * 4),
              color: theme.appBackgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 2),
                child: Text(
                  'Would you like to write a post?',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: theme.lightTextColor,
                      fontSize: screenWidth * 3.9),
                ),
              ),
              writePostAlertBoxButtons(screenWidth)
            ],
          ),
        ),
      ),
    );
  }

  Widget writePostAlertBoxButtons(screenWidth) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showWritePostAlertBox = false;
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
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
                  decoration: TextDecoration.none,
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
              setState(() {
                showWritePostAlertBox = false;
              });
              Fluttertoast.showToast(
                  msg: "Your post has been successfully uploaded.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: screenWidth * 2);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 2),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  decoration: TextDecoration.none,
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
}
