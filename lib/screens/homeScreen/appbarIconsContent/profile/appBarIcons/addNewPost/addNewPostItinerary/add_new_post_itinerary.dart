import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

class AddNewPostItinerary extends StatefulWidget {
  const AddNewPostItinerary({Key? key}) : super(key: key);

  @override
  _AddNewPostItineraryState createState() => _AddNewPostItineraryState();
}

class _AddNewPostItineraryState extends State<AddNewPostItinerary> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenWidth * 20,
            ),
            Text(
              'What kind of trip are you planning?',
              style: TextStyle(
                  color: theme.darkTextColor,
                  fontSize: screenWidth * 6,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: screenWidth * 7,
            ),
            Text('By place',
                style: TextStyle(
                    fontSize: screenWidth * 4.5,
                    color: theme.lightTextColor,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: screenWidth * 3),
            byPlace(screenWidth),
            SizedBox(
              height: screenWidth * 7,
            ),
            Text('By style',
                style: TextStyle(
                    fontSize: screenWidth * 4.5,
                    color: theme.lightTextColor,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: screenWidth * 3),
            byStyle(screenWidth),
            SizedBox(
              height: screenWidth * 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget byPlace(screenWidth) {
    return Wrap(
      children: [
        for (int i = 0; i < byPlaceTagsList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    byPlaceTagsList[i].selected = !byPlaceTagsList[i].selected;
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(screenWidth * 2),
                    margin: EdgeInsets.only(
                        right: screenWidth * 3, bottom: screenWidth * 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 1.5),
                        color: byPlaceTagsList[i].selected
                            ? theme.mainColor
                            : theme.appBackgroundColor,
                        boxShadow: AllShadows().boxShadow()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(byPlaceTagsList[i].name,
                            style: TextStyle(
                                color: byPlaceTagsList[i].selected
                                    ? Colors.white
                                    : theme.lightTextColor,
                                fontSize: screenWidth * 3)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }

  Widget byStyle(screenWidth) {
    return Wrap(
      children: [
        for (int i = 0; i < byStyleTagsList.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    byStyleTagsList[i].selected = !byStyleTagsList[i].selected;
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(screenWidth * 2),
                    margin: EdgeInsets.only(
                        right: screenWidth * 3, bottom: screenWidth * 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 1.5),
                        color: byStyleTagsList[i].selected
                            ? theme.mainColor
                            : theme.appBackgroundColor,
                        boxShadow: AllShadows().boxShadow()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(byStyleTagsList[i].name,
                            style: TextStyle(
                                color: byStyleTagsList[i].selected
                                    ? Colors.white
                                    : theme.lightTextColor,
                                fontSize: screenWidth * 3)),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }

  List<dynamic> byPlaceTagsList = [
    tagsModel('Domestic'),
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('South East Asia'),
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('South East Asia'),
    tagsModel('Middle East'),
    tagsModel('Asia'),
    tagsModel('Africa'),
    tagsModel('Middle East'),
    tagsModel('Asia'),
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('South East Asia'),
    tagsModel('Middle East'),
    tagsModel('Asia'),
    tagsModel('Africa'),
    tagsModel('Africa'),
  ];
  List<dynamic> byStyleTagsList = [
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('South East Asia'),
    tagsModel('Middle East'),
    tagsModel('Asia'),
    tagsModel('Africa'),
    tagsModel('Asia'),
    tagsModel('Africa'),
    tagsModel('South East Asia'),
    tagsModel('Middle East'),
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('South East Asia'),
    tagsModel('Middle East'),
    tagsModel('Asia'),
    tagsModel('Africa'),
    tagsModel('China'),
    tagsModel('Japan'),
    tagsModel('South East Asia'),
    tagsModel('Middle East'),
    tagsModel('Asia'),
    tagsModel('Africa'),
    tagsModel('Domestic'),
  ];
}

class tagsModel {
  final String name;
  bool selected;

  tagsModel(this.name, {this.selected = false});
}
