import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  final style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  FlTitlesData getTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(sideTitles: _bottomTitles),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(
        sideTitles: _rightTitles,
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) {
          String text = '';
          final result = value % 25;
          switch (result.toInt()) {
            case 1:
              text = 'MON';
              break;
            case 4:
              text = 'THU';
              break;
            case 7:
              text = 'SAT';
              break;
            case 10:
              text = 'TUE';
              break;
          }
          return Text(
            text,
            style: style,
          );
        },
      );
  SideTitles get _rightTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          final result = value % 14;
          switch (result.toInt()) {
            case 1:
              text = '100';
              break;
            case 3:
              text = '300';
              break;
            case 5:
              text = '500';
              break;
          }
          return Text(
            text,
            style: style,
          );
        },
        reservedSize: 40,
      );
}
