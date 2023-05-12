import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../line_titles.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LineTitles lineTitles = LineTitles();
    return AspectRatio(
        aspectRatio: 2,
        child: LineChart(LineChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: lineTitles.getTitleData(),
            minX: 0,
            minY: 0,
            maxX: 12,
            maxY: 8,
            lineBarsData: [
              if (MediaQuery.of(context).size.width < 600)
                LineChartBarData(
                  color: Colors.white,
                  spots: [
                    FlSpot(0, 2.5),
                    FlSpot(2, 2),
                    FlSpot(4, 3),
                    FlSpot(6, 2.6),
                    FlSpot(8, 4),
                    FlSpot(10, 3),
                    FlSpot(12, 4.5),
                  ],
                )
              else
                LineChartBarData(
                  color: Colors.white,
                  spots: [
                    FlSpot(0, 2.5),
                    FlSpot(1, 2),
                    FlSpot(2, 3),
                    FlSpot(3, 2.6),
                    FlSpot(4, 4),
                    FlSpot(5, 3),
                    FlSpot(6, 4.5),
                    FlSpot(7, 5),
                    FlSpot(8, 5.5),
                    FlSpot(9, 4),
                    FlSpot(10, 3),
                    FlSpot(11, 4.5),
                    FlSpot(12, 5.5),
                  ],
                )
            ])));
  }
}
