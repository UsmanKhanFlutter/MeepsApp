import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/theme/colors.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  List<String> popularTagsList = [
    'jeju',
    'busam 2 dyas 1 night',
    'namhe food trip',
    'domestic travel',
    'uk travel'
        'best food trip ever',
    'busam 2 dyas 1 night',
    'namhe food trip',
    'domestic travel',
    'uk travel',
    'busam 2 dyas 1 night',
    'namhe food trip',
    'domestic travel',
    'domestic travel',
    'busam 2 dyas 1 night',
    'namhe food trip',
  ];
  List<String> cityTagsList = [
    'Tokyo,japan',
    'Oaka,japan',
    'Los angeles,usa',
    'domestic travel',
    'London,england',
    'Oaka,japan',
    'Los angeles,usa',
    'domestic travel',
    'Oaka,japan',
    'Los angeles,usa',
    'domestic travel',
    'London,england',
    'Oaka,japan',
    'Oaka,japan',
    'Oaka,japan',
    'Los angeles,usa',
    'domestic travel',
    'London,england',
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, '', screenWidth),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'How are other people traveling?',
                  style: TextStyle(
                      color: theme.darkTextColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
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
                      hintText: 'Where are you traveling?',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: SizeConfig.widthMultiplier * 3.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Popular tag',
                    style: TextStyle(
                        fontSize: 19,
                        color: theme.lightTextColor,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                popularTags(),
                SizedBox(
                  height: 30,
                ),
                Text('Tags by city',
                    style: TextStyle(
                        fontSize: 19,
                        color: theme.lightTextColor,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                cityTags(),
                SizedBox(
                  height: 80,
                ),
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

  Widget popularTags() {
    return Wrap(
      children: [
        for (int i = 0; i < popularTagsList.length; i++)
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
                        Text(popularTagsList[i],
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

  Widget cityTags() {
    return Wrap(
      children: [
        for (int i = 0; i < cityTagsList.length; i++)
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
                        Text(cityTagsList[i],
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
