import 'package:flutter/material.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  List<_PieData> pieData = [
    _PieData('20%', 40, Color(0xff32d5d7)),
    _PieData('40%', 30, Color(0xff41DDDF)),
    _PieData('15%', 20, Color(0xff56E4E6)),
    _PieData('10%', 15, Color(0xff76E8E9)),
    _PieData('15%', 10, Color(0xff92EAEB))
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Center(
        child: Container(
          alignment: Alignment.center,
          height: 270,
          width: 270,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.appBackgroundColor,
              boxShadow: AllShadows().boxShadow()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('1,532,590 Won',
                  style: TextStyle(
                      fontSize: 18,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w500)),
              Text('1000 Dollars',
                  style: TextStyle(
                      fontSize: 16,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              Text('Total expenditure',
                  style: TextStyle(
                      fontSize: 12,
                      color: theme.lightTextColor,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
      Center(
          child: SfCircularChart(
              palette: [Colors.green],
              margin: EdgeInsets.all(0),
              series: <DoughnutSeries<_PieData, String>>[
                DoughnutSeries<_PieData, String>(
                    pointColorMapper: (_PieData data, index) => data.color,
                    strokeColor: theme.appBackgroundColor,
                    strokeWidth: 3,
                    innerRadius: '80',
                    dataSource: pieData,
                    xValueMapper: (_PieData data, _) => data.xData,
                    yValueMapper: (_PieData data, _) => data.yData,
                    dataLabelMapper: (_PieData data, _) => data.xData,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                            color: theme.appBackgroundColor, fontSize: 13))),
              ]))
    ]);
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.color);
  final String xData;
  final num yData;
  final Color? color;
}
