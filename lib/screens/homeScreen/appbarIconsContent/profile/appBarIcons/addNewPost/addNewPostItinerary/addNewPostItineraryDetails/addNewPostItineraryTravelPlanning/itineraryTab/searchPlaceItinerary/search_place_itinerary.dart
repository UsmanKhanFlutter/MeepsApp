import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/components/widgets/simple_appbar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

class SearchPlaceItinerary extends StatefulWidget {
  const SearchPlaceItinerary({Key? key}) : super(key: key);

  @override
  _SearchPlaceItineraryState createState() => _SearchPlaceItineraryState();
}

class _SearchPlaceItineraryState extends State<SearchPlaceItinerary> {
  TextEditingController searchText = TextEditingController();
  @override
  void dispose() {
    searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: simpleAppBar(context, 'Itinerary search', screenWidth),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 6,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                decoration: BoxDecoration(
                    color: theme.appBackgroundColor,
                    borderRadius: BorderRadius.circular(screenWidth * 2),
                    boxShadow: AllShadows().boxShadow()),
                child: TextField(
                  controller: searchText,
                  onChanged: (value) {
                    setState(() {});
                  },
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: SizeConfig.widthMultiplier * 3.5,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/search_icon_colored.png',
                      width: SizeConfig.widthMultiplier * 4,
                      height: SizeConfig.widthMultiplier * 4,
                    ),
                    prefixIconConstraints: BoxConstraints(
                        minWidth: SizeConfig.widthMultiplier * 10),
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {});
                        searchText.clear();
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.only(right: screenWidth * 3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: searchText.text.length > 0
                                ? theme.lightTextColor
                                : theme.appBackgroundColor),
                        child: Icon(
                          Icons.close,
                          size: SizeConfig.widthMultiplier * 3,
                          color: searchText.text.length > 0
                              ? Colors.white
                              : theme.appBackgroundColor,
                        ),
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                        minWidth: SizeConfig.widthMultiplier * 8),
                    border: InputBorder.none,
                    hintText: 'Search for tourist attractions/restaurants',
                    hintStyle: TextStyle(
                        color: theme.lightTextColor,
                        fontSize: SizeConfig.widthMultiplier * 3.5,
                        fontWeight: FontWeight.w300),
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
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         TourOrActivitySearchResult()));
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    bottom: screenWidth * 3,
                                    right: screenWidth * 4,
                                    left: screenWidth * 4),
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
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: theme.lightTextColor,
                                        ),
                                        SizedBox(
                                          width: SizeConfig.widthMultiplier * 2,
                                        ),
                                        Text('Aquarium',
                                            style: TextStyle(
                                                color: theme.lightTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    SizeConfig.widthMultiplier *
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
                        recentSearchKeywords(screenWidth),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4)
                                  .copyWith(top: screenWidth * 6),
                          child: Text(
                            'Recommended itinerary',
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontSize: screenWidth * 4.3,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 3,
                        ),
                        for (int i = 0; i < 7; i++)
                          recommendedItinerary(screenWidth, i)
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget recentSearchKeywords(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 6,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent search keywords',
                  style: TextStyle(
                      fontSize: screenWidth * 3.1,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w400)),
              Text('delete all',
                  style: TextStyle(
                      fontSize: screenWidth * 3.1,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w500))
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        for (int i = 0; i < 3; i++)
          Container(
              margin: EdgeInsets.only(
                  bottom: screenWidth * 3,
                  left: screenWidth * 4,
                  right: screenWidth * 4),
              height: SizeConfig.widthMultiplier * 13,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 3.5),
              decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(screenWidth * 2),
                  boxShadow: AllShadows().boxShadow()),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: SizeConfig.widthMultiplier * 5,
                        color: theme.lightTextColor,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2,
                      ),
                      Row(
                        children: [
                          Text('Seoul',
                              style: TextStyle(
                                  color: theme.lightTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.widthMultiplier * 3.3)),
                          SizedBox(
                            width: screenWidth,
                          ),
                          Text('south korea',
                              style: TextStyle(
                                  color: theme.lightTextColor!.withOpacity(.6),
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.widthMultiplier * 2.8))
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.close,
                    size: SizeConfig.widthMultiplier * 4,
                    color: theme.lightTextColor,
                  )
                ],
              )),
      ],
    );
  }

  Widget recommendedItinerary(screenWidth, i) {
    return Container(
      height: SizeConfig.widthMultiplier * 15,
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(screenWidth * 2),
          boxShadow: AllShadows().boxShadow()),
      margin: EdgeInsets.only(
          right: screenWidth * 4,
          bottom: screenWidth * 3,
          left: screenWidth * 4),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: SizeConfig.widthMultiplier * 12,
                width: SizeConfig.widthMultiplier * 13,
                margin: EdgeInsets.all(screenWidth),
                padding: EdgeInsets.all(screenWidth * .5),
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  borderRadius: BorderRadius.circular(screenWidth * 2),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/aquarium.png')),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seongsan Sunrise Peak',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.widthMultiplier * 3.8),
                    ),
                    Text(
                      'jeju island,california',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.widthMultiplier * 2.8),
                    )
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 3, left: screenWidth),
            child: NeumorphicTheme(
              theme: NeumorphicThemeData(
                  baseColor: Color(0XFFF2F2F2),
                  intensity: .8,
                  depth: 2,
                  shadowDarkColorEmboss: Colors.grey.shade200,
                  // oppositeShadowLightSource: true,
                  shadowLightColorEmboss: Colors.white),
              child: NeumorphicIcon(
                Icons.favorite,
                size: screenWidth * 6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
