import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/screens/homeScreen/store/topButtons/tourOrActivity/searchByRegionOrPackageName/tourActivitySearchresult/tour_activity_search_result.dart';
import 'package:meeps/theme/colors.dart';

class SearchByRegionOrPackageName extends StatefulWidget {
  @override
  _SearchByRegionOrPackageNameState createState() =>
      _SearchByRegionOrPackageNameState();
}

class _SearchByRegionOrPackageNameState
    extends State<SearchByRegionOrPackageName> {
  TextEditingController searchText = TextEditingController();
  bool isSearched = false;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 2,
                    lightSource: LightSource.topLeft,
                    intensity: 1,
                    shadowDarkColor: Colors.grey.shade400,
                    shadowLightColor: Colors.white,

                    // oppositeShadowLightSource: true,
                  ),
                  child: TextField(
                    controller: searchText,
                    onChanged: (value) {
                      setState(() {});
                    },
                    onTap: () {
                      setState(() {
                        isSearched = true;
                      });
                    },
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: SizeConfig.widthMultiplier * 3.5,
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
                            size: SizeConfig.widthMultiplier * 3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                          minWidth: SizeConfig.widthMultiplier * 1),
                      prefixIcon: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: SizeConfig.widthMultiplier * 5,
                          color: theme.lightTextColor,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                          minWidth: SizeConfig.widthMultiplier * 10),
                      filled: true,
                      fillColor: theme.simpleButtonColor,
                      border: InputBorder.none,
                      hintText: 'Search by region or package name',
                      hintStyle: TextStyle(
                          color: theme.lightTextColor,
                          fontSize: SizeConfig.widthMultiplier * 3.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                searchText.text.length > 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TourOrActivitySearchResult()));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: SizeConfig.widthMultiplier * 13,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.widthMultiplier * 3.5),
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
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.search,
                                            size:
                                                SizeConfig.widthMultiplier * 5,
                                            color: theme.lightTextColor,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.widthMultiplier * 2,
                                          ),
                                          Text('Aquarium',
                                              style: TextStyle(
                                                  color: theme.lightTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeConfig
                                                          .widthMultiplier *
                                                      3.3)),
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
                          !isSearched
                              ? SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Recent search keywords',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: theme.lightTextColor,
                                                fontWeight: FontWeight.w400)),
                                        Text('Delete all',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: theme.lightTextColor,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: SizeConfig.widthMultiplier * 13,
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.widthMultiplier *
                                                    3.5),
                                        decoration: BoxDecoration(
                                          color: theme.appBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.search,
                                                  size: SizeConfig
                                                          .widthMultiplier *
                                                      5,
                                                  color: theme.lightTextColor,
                                                ),
                                                SizedBox(
                                                  width: SizeConfig
                                                          .widthMultiplier *
                                                      2,
                                                ),
                                                Text('Aquarium',
                                                    style: TextStyle(
                                                        color: theme
                                                            .lightTextColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: SizeConfig
                                                                .widthMultiplier *
                                                            3.3)),
                                              ],
                                            ),
                                            Icon(
                                              Icons.close,
                                              size: SizeConfig.widthMultiplier *
                                                  4,
                                              color: theme.lightTextColor,
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                          SizedBox(
                            height: 30,
                          ),
                          Text('Popular domestic destinations',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 10),
                          popularDomesticDestinations(),
                          SizedBox(
                            height: 30,
                          ),
                          Text('Popular categories',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 10),
                          popularCategories(),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
  ////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////Widgets//////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////

  Widget popularDomesticDestinations() {
    return Wrap(
      children: [
        for (int i = 0; i < popularDomesticDestinationsList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: theme.appBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: const Offset(1, 1),
                            spreadRadius: 1,
                            color: Colors.grey.shade400),
                        const BoxShadow(
                            offset: Offset(-1, -1),
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: Colors.white),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(popularDomesticDestinationsList[i],
                            style: TextStyle(
                                color: theme.lightTextColor, fontSize: 12)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }

  Widget popularCategories() {
    return Wrap(
      children: [
        for (int i = 0; i < popularCategoriesList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: theme.appBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: const Offset(1, 1),
                            spreadRadius: 1,
                            color: Colors.grey.shade400),
                        const BoxShadow(
                            offset: Offset(-1, -1),
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: Colors.white),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(popularCategoriesList[i],
                            style: TextStyle(
                                color: theme.lightTextColor, fontSize: 12)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }
}
