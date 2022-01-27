import 'dart:math' as math;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/depositPopupBlock/deposit_popup_block.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/existingPostSlideUp/existing_post_slide_up.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/expensesPopupBlock/expenses_popup_block.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostCost/addNewPostCostTravelPlanning/travelCostStatistics/travel_cost_statistics.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../../profile.dart';

class AddNewPostCostTravelPlanning extends StatefulWidget {
  const AddNewPostCostTravelPlanning({Key? key}) : super(key: key);

  @override
  _AddNewPostCostTravelPlanningState createState() =>
      _AddNewPostCostTravelPlanningState();
}

class _AddNewPostCostTravelPlanningState
    extends State<AddNewPostCostTravelPlanning>
    with SingleTickerProviderStateMixin {
  AnimationController? rotationController;

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
                        SizedBox(height: screenWidth * 5),
                        TravelCostStatistics(),
                        SizedBox(
                          height: screenWidth * 30,
                        ),
                      ],
                    ),
                  ),
                  provData.showCostExpensesPopup
                      ? ExpensesPopupBlock()
                      : provData.showCostDepositsPopup
                          ? DepositPopupBlock()
                          : SizedBox(),
                  ExistingPostSlideUp(),
                  !provData.showCostExistingPostAlertBox
                      ? SizedBox()
                      : createPostAlertBox(screenWidth)
                ],
              )),
          !showWritePostAlertBox ? SizedBox() : createPostAlertBox(screenWidth),
          AnimatedPositioned(
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
                      .showCostDepositsPopupBlock();
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
          AnimatedPositioned(
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
                      .showCostExpensesPopupBlock();
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
          Positioned(
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
                  turns:
                      Tween(begin: 1.0, end: 1.12).animate(rotationController!),
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

  Widget createPostAlertBox(screenWidth) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Container(
          height: screenWidth * 32,
          width: screenWidth * 84,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 3, vertical: screenWidth * 4),
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
                Provider.of<StateSettingProvider>(context, listen: false)
                    .showCostExistingPostSlideUp = true;
                Provider.of<StateSettingProvider>(context, listen: false)
                    .showCostExistingPostAlertBox = false;
                showWritePostAlertBox = false;
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SignupWithEmailPassswordProfileSettings()));
            },
            child: Container(
              height: screenWidth * 9,
              margin: EdgeInsets.symmetric(horizontal: screenWidth),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.appBackgroundColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Add to existing post',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                  color: theme.lightTextColor,
                  fontSize: screenWidth * 3,
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
              margin: EdgeInsets.symmetric(horizontal: screenWidth),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 70),
                color: theme.coloredButtonColor,
                boxShadow: AllShadows().boxShadow(),
              ),
              child: Text(
                'Create a post',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: screenWidth * 3,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
