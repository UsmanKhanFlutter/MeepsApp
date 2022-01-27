import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';

class SlidingPage1 extends StatelessWidget {
  const SlidingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenWidth * 44,
          width: double.infinity,
          margin: EdgeInsets.only(right: screenWidth * 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 4),
              boxShadow: AllShadows().boxShadow(),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/map2.png'))),
        ),
        SizedBox(height: screenWidth * 8),
        gridPhotos(screenWidth),
        SizedBox(height: screenWidth * 8),
      ],
    );
  }

  Widget gridPhotos(screenWidth) {
    return Container(
        alignment: Alignment.center,
        height: screenWidth * 97,
        width: double.infinity,
        margin: EdgeInsets.only(right: screenWidth * 4),
        padding: EdgeInsets.all(screenWidth * 2),
        decoration: BoxDecoration(
          color: theme.appBackgroundColor,
          borderRadius: BorderRadius.circular(screenWidth * 3),
          boxShadow: AllShadows().boxShadow(),
        ),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: .96),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(screenWidth * 2.3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 3),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/wallpaper.jpg'))),
              );
            }));
  }
}
