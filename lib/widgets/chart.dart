import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../bar_items/bardata.dart';

class MyBarData extends StatelessWidget {
  final List weeklySum;
  const MyBarData({super.key, required this.weeklySum});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    var myBardata = BarData(
        sun: weeklySum[0],
        mon: weeklySum[1],
        tue: weeklySum[2],
        wed: weeklySum[3],
        thu: weeklySum[4],
        fri: weeklySum[5],
        sat: weeklySum[6]);
    myBardata.initilizedBarData();

    return BarChart(BarChartData(
      maxY: 60,
      minY: 0,
      gridData: FlGridData(
        checkToShowVerticalLine: (value) => false,
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            width: 1,
          ),
          left: BorderSide(
            width: 1,
          ),
        ),
      ),
      titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          )),
      barGroups: myBardata.bars
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Color(0xff528DE7),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7)),
                  width: width * 25 / 360,
                ),
              ]))
          .toList(),
    ));
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'sun';
          break;
        case 1:
          text = 'mon';
          break;
        case 2:
          text = 'tue';
          break;
        case 3:
          text = 'wed';
          break;
        case 4:
          text = 'thu';
          break;
        case 5:
          text = 'fri';
          break;
        case 6:
          text = 'sat';
          break;
      }

      return Text(text, style: TextStyle(fontSize: 14),);
    });
}

class UserChart extends StatefulWidget {
  const UserChart({super.key});

  @override
  State<UserChart> createState() => _UserChartState();
}

class _UserChartState extends State<UserChart> {
  static List<double> chartData = [
    45.0,
    15.0,
    17.0,
    13.0,
    27.0,
    8.0,
    12.0,
  ];
  double maxData = 27.0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SizedBox(
        height: height * 190 / 800,
        child: MyBarData(
          weeklySum: chartData,
        ));
  }
}
