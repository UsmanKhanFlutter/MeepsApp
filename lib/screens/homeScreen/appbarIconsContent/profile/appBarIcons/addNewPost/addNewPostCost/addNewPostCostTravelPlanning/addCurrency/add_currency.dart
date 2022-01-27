import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/pop_navigation.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/searchByRegionOrPackageName/tourActivitySearchresult/tour_activity_search_result.dart';
import 'package:meeps/theme/colors.dart';

class AddCurrency extends StatefulWidget {
  @override
  _AddCurrencyState createState() => _AddCurrencyState();
}

class _AddCurrencyState extends State<AddCurrency> {
  TextEditingController searchText = TextEditingController();
  bool isEditing = false;
  List<String> popularDomesticDestinationsList = [
    'Seoul',
    'Busan',
    'Jeju',
  ];
  List<String> popularCategoriesList = [
    'Theme park',
    'Water park',
    'Tour/guide',
    'Aquarium',
    'Zoo',
    'Surfing'
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context, screenWidth),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 6,
              ),
              Neumorphic(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                style: AllShadows().neumorphicShadow(screenWidth, depth: 2),
                child: TextField(
                  controller: searchText,
                  onChanged: (value) {
                    setState(() {});
                  },
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: screenWidth * 3.5,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    suffix: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.lightTextColor),
                        child: Icon(
                          Icons.close,
                          size: screenWidth * 3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    suffixIconConstraints:
                        BoxConstraints(minWidth: screenWidth * 1),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.search,
                        size: screenWidth * 5,
                        color: theme.mainColor,
                      ),
                    ),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: screenWidth * 10),
                    filled: true,
                    fillColor: theme.simpleButtonColor,
                    border: InputBorder.none,
                    hintText: 'Search currency',
                    hintStyle: TextStyle(
                        color: theme.mainColor!.withOpacity(.6),
                        fontSize: screenWidth * 3.5,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              searchText.text.length > 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenWidth * 5,
                        ),
                        for (int i = 0; i < 5; i++)
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      TourOrActivitySearchResult()));
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 4)
                                    .copyWith(bottom: screenWidth * 3),
                                height: screenWidth * 13,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 3.5),
                                decoration: BoxDecoration(
                                    color: theme.appBackgroundColor,
                                    borderRadius:
                                        BorderRadius.circular(screenWidth * 2),
                                    boxShadow: AllShadows().boxShadow()),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          size: screenWidth * 5,
                                          color: theme.lightTextColor,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 2,
                                        ),
                                        Text('Aquarium',
                                            style: TextStyle(
                                                color: theme.lightTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: screenWidth * 3.3)),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenWidth * 6,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('My currency',
                                      style: TextStyle(
                                          fontSize: screenWidth * 3.7,
                                          color: theme.lightTextColor,
                                          fontWeight: FontWeight.w400)),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isEditing = !isEditing;
                                      });
                                    },
                                    child: Text(isEditing ? 'Done' : 'Edit',
                                        style: TextStyle(
                                            fontSize: screenWidth * 3.7,
                                            color: theme.mainColor,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenWidth * 3,
                            ),
                            for (int i = 0; i < 4; i++)
                              Container(
                                  margin: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 4)
                                      .copyWith(bottom: screenWidth * 3),
                                  height: screenWidth * 13,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 3.5),
                                  decoration: BoxDecoration(
                                      color: theme.appBackgroundColor,
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 2),
                                      boxShadow: AllShadows().boxShadow()),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          !isEditing
                                              ? SizedBox()
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      right: screenWidth * 2),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: screenWidth * 5,
                                                    color: theme.lightTextColor,
                                                  ),
                                                ),
                                          Text('Aquarium',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: screenWidth * 3.3)),
                                        ],
                                      ),
                                      !isEditing
                                          ? SizedBox()
                                          : Icon(
                                              Icons.horizontal_split,
                                              size: screenWidth * 4,
                                              color: theme.lightTextColor,
                                            )
                                    ],
                                  )),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 6,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4)
                                  .copyWith(bottom: screenWidth * 3),
                          child: Text('Add new currency',
                              style: TextStyle(
                                  fontSize: screenWidth * 3.7,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                        for (int i = 0; i < 4; i++)
                          Container(
                              margin: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 4)
                                  .copyWith(bottom: screenWidth * 3),
                              height: screenWidth * 13,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 3.5),
                              decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 2),
                                  boxShadow: AllShadows().boxShadow()),
                              alignment: Alignment.centerLeft,
                              child: Text('British pound',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 3.3))),
                      ],
                    )
            ],
          ),
        ),
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
        'Add currency',
        style: TextStyle(color: theme.darkTextColor, fontSize: screenWidth * 5),
      ),
      actions: [
        TextButton(
          onPressed: () {
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
}
