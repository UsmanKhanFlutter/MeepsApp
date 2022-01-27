import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<_barData> barData = [
    _barData('Hotel', '35%', Color(0xff32d5d7), 50),
    _barData('Food', '20%', Color(0xff41DDDF), 30),
    _barData('Car rental', '15%', Color(0xff56E4E6), 20),
    _barData('Etc', '12%', Color(0xff76E8E9), 14),
    _barData('Airplane', '8%', Color(0xff92EAEB), 10)
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenWidth * 8,
          ),
          for (int i = 0; i < barData.length; i++)
            Padding(
              padding: EdgeInsets.only(bottom: screenWidth * 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(barData[i].leadingText,
                        style: TextStyle(
                            fontSize: screenWidth * 3.3,
                            color: theme.lightTextColor,
                            fontWeight: FontWeight.w400)),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: screenWidth * 4),
                          height: screenWidth * 4.5,
                          width: screenWidth * barData[i].percentage,
                          color: barData[i].color,
                        ),
                        Text(barData[i].labelText,
                            style: TextStyle(
                                fontSize: screenWidth * 3.3,
                                color: theme.lightTextColor,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}

class _barData {
  _barData(this.leadingText, this.labelText, this.color, this.percentage);
  final String leadingText;
  final String labelText;
  final Color? color;
  final double percentage;
}
