import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/screens/homeScreen/appbarIconsContent/profile/appBarIcons/addNewPost/addNewPostItinerary/addNewPostItineraryDetails/addNewPostItineraryTravelPlanning/itineraryTab/searchPlaceItinerary/search_place_itinerary.dart';
import 'package:meeps/theme/colors.dart';

class ItineraryTab extends StatefulWidget {
  @override
  State<ItineraryTab> createState() => _ItineraryTabState();
}

class _ItineraryTabState extends State<ItineraryTab> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mapBlock(screenWidth),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Planned Itinerary',
                style: TextStyle(
                    color: theme.lightTextColor,
                    fontSize: screenWidth * 4.3,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: screenWidth * 2,
              ),
              SizedBox(
                height: screenWidth * 3.5,
                width: screenWidth * 4.5,
                child: Image.asset(
                  'assets/arrow_down_icon.png',
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        for (int i = 0; i < plannedItineraryList.length; i++)
          plannedItinerary(screenWidth, i),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 5),
          child: Text(
            'Itinerary Planning',
            style: TextStyle(
                color: theme.lightTextColor,
                fontSize: screenWidth * 4.2,
                fontWeight: FontWeight.w500),
          ),
        ),
        for (int i = 1; i < 5; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                    .copyWith(top: screenWidth * 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Day $i',
                      style: TextStyle(
                          color: theme.lightTextColor,
                          fontSize: screenWidth * 3.8,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '12.07.2021(Tue)',
                      style: TextStyle(
                        color: theme.lightTextColor,
                        fontSize: screenWidth * 3.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 4,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                padding: EdgeInsets.all(screenWidth * 4),
                decoration: BoxDecoration(
                  color: theme.appBackgroundColor,
                  boxShadow: AllShadows().boxShadow(),
                  borderRadius: BorderRadius.circular(screenWidth * 3),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth,
                    ),
                    i != 1
                        ? SizedBox()
                        : Column(
                            children: [
                              isDone
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '10:00',
                                          style: TextStyle(
                                              color: theme.lightTextColor,
                                              fontSize: screenWidth * 3.6,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 3,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Arrival and boarding at Gimpo AirportArrival and boarding at Gimpo Airport',
                                            style: TextStyle(
                                                color: theme.lightTextColor,
                                                fontSize: screenWidth * 3.4,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: screenWidth * 17,
                                            child: TextField(
                                              style: TextStyle(
                                                  fontSize: screenWidth * 3.3,
                                                  color: theme.lightTextColor),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  isCollapsed: true,
                                                  hintText: 'Enter time',
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                          screenWidth * 3.3,
                                                      color: theme.mainColor)),
                                            )),
                                        Text(
                                          'Go to ',
                                          style: TextStyle(
                                              color: theme.darkTextColor,
                                              fontSize: screenWidth * 3.5,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                            width: screenWidth * 40,
                                            child: TextField(
                                              maxLines: null,
                                              style: TextStyle(
                                                  fontSize: screenWidth * 3.3,
                                                  color: theme.lightTextColor),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  isCollapsed: true,
                                                  hintText: 'Enter place',
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                          screenWidth * 3.3,
                                                      color: theme.mainColor)),
                                            )),
                                        SizedBox(
                                          width: screenWidth * 2,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isDone = true;
                                            });
                                          },
                                          child: Icon(
                                            Icons.done,
                                            color: theme.lightTextColor,
                                            size: screenWidth * 5,
                                          ),
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: theme.lightTextColor,
                                          size: screenWidth * 5,
                                        ),
                                        Icon(
                                          Icons.close,
                                          color: theme.lightTextColor,
                                          size: screenWidth * 5,
                                        )
                                      ],
                                    ),
                              SizedBox(height: screenWidth * 5),
                            ],
                          ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      SearchPlaceItinerary()));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: screenWidth * 10,
                                margin: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 4,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.appBackgroundColor,
                                  boxShadow: AllShadows().boxShadow(),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 3),
                                ),
                                child: Text(
                                  'Search place',
                                  style: TextStyle(
                                      color: theme.lightTextColor,
                                      fontSize: screenWidth * 3),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              height: screenWidth * 10,
                              margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.appBackgroundColor,
                                boxShadow: AllShadows().boxShadow(),
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 3),
                              ),
                              child: Text(
                                'Enter directly',
                                style: TextStyle(
                                    color: theme.lightTextColor,
                                    fontSize: screenWidth * 3),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
      ],
    );
  }

  Widget mapBlock(screenWidth) {
    return Container(
      height: screenWidth * 50,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      decoration: BoxDecoration(
          boxShadow: AllShadows().boxShadow(),
          borderRadius: BorderRadius.circular(screenWidth * 3),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/map2.png'))),
    );
  }

  Widget plannedItinerary(screenWidth, i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          plannedItineraryList[i]['isExpanded'] =
              !plannedItineraryList[i]['isExpanded'];
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: theme.appBackgroundColor,
            borderRadius: BorderRadius.circular(screenWidth * 2),
            boxShadow: AllShadows().boxShadow()),
        margin: EdgeInsets.only(
            right: screenWidth * 4,
            bottom: screenWidth * 3,
            left: screenWidth * 4),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      height: SizeConfig.widthMultiplier * 12,
                      width: SizeConfig.widthMultiplier * 13,
                      margin: EdgeInsets.symmetric(vertical: screenWidth * 2),
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
                            plannedItineraryList[i]['name'],
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.widthMultiplier * 3.8),
                          ),
                          Text(
                            plannedItineraryList[i]['date'],
                            style: TextStyle(
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.widthMultiplier * 2.8),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            !plannedItineraryList[i]['isExpanded']
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                        for (int i = 0; i < plannedItinerarySubList.length; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                plannedItinerarySubList[i]['selected'] =
                                    !plannedItinerarySubList[i]['selected'];
                              });
                            },
                            child: Container(
                              height: screenWidth * 16,
                              padding: EdgeInsets.all(screenWidth * 2),
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 4,
                                  vertical: screenWidth * 2),
                              decoration: BoxDecoration(
                                  color: plannedItinerarySubList[i]['selected']
                                      ? theme.mainColor
                                      : theme.appBackgroundColor,
                                  boxShadow: AllShadows().boxShadow(),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 2)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    plannedItinerarySubList[i]['name'],
                                    style: TextStyle(
                                        color: plannedItinerarySubList[i]
                                                ['selected']
                                            ? Colors.white
                                            : theme.lightTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            SizeConfig.widthMultiplier * 3.3),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      plannedItinerarySubList[i]['date'],
                                      style: TextStyle(
                                          color: plannedItinerarySubList[i]
                                                  ['selected']
                                              ? Colors.white
                                              : theme.lightTextColor!
                                                  .withOpacity(.8),
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              SizeConfig.widthMultiplier * 3.1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        SizedBox(
                          height: screenWidth,
                        )
                      ])
          ],
        ),
      ),
    );
  }

  List<dynamic> plannedItineraryList = [
    {
      'name': 'Jeju island',
      'date': '08.26.2021 - 09.01.2021',
      'isExpanded': false
    },
    {'name': 'Japan', 'date': '05.05.2021 - 04.09.2021', 'isExpanded': false},
    {'name': 'Tokyo', 'date': '06.06.2021 - 09.12.2021', 'isExpanded': false}
  ];
  List<dynamic> plannedItinerarySubList = [
    {
      'name': 'Lucky_seven\'s Jeju Island Honeymoon + restaurant 7-Day Trip',
      'date': 'Day1 schedule',
      'selected': false
    },
    {
      'name': 'Lucky_seven\'s Jeju Island Honeymoon + restaurant 7-Day Trip',
      'date': 'Day1 schedule',
      'selected': false
    },
    {
      'name': 'Lucky_seven\'s Jeju Island Honeymoon + restaurant 7-Day Trip',
      'date': 'Day1 schedule',
      'selected': false
    },
  ];
}
