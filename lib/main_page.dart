import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _weight = 0.0;
  double _height = 0.0;
  int _hour = 12;
  int _min = 59;

  List<Color> gradientColors = [
    Color.fromARGB(255, 9, 162, 37),
    Color.fromARGB(255, 18, 189, 109),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'WITH EAT',
          style: TextStyle(
            fontFamily: 'Agbalumo',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.systemGreen,
          ),
        ),
        elevation: 0.0,
        backgroundColor: CupertinoColors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          Column(
            children: [
              Container(
                //padding: EdgeInsets.all(2.0),
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                width: 180,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '몸무게: $_weight',
                      style: TextStyle(
                        fontFamily: 'godo',
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      '신장: $_height',
                      style: TextStyle(
                        fontFamily: 'godo',
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                /*
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ()),
                  );
                },
                */
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 70.0, 0, 50.0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CupertinoColors.systemGrey5,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '하루 섭취량',
                        style: TextStyle(
                          fontFamily: 'godo',
                          fontSize: 17.0,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Text(
                        '(kcal)',
                        style: TextStyle(
                          fontFamily: 'godo',
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  width: 180,
                  height: 100,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: LineChart(
                    LineChartData(
                      //backgroundColor: CupertinoColors.systemGrey6,
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        horizontalInterval: 1,
                        verticalInterval: 1,
                        getDrawingHorizontalLine: (value) {
                          return const FlLine(
                            color: CupertinoColors.systemGrey5,
                            strokeWidth: 1,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return const FlLine(
                            color: CupertinoColors.systemGrey5,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            getTitlesWidget: bottomTitleWidgets,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: leftTitleWidgets,
                            reservedSize: 30,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                        border: Border.all(
                          color: const Color(0xff37434d),
                        ),
                      ),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 8,
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 6),
                            FlSpot(1.7, 5.7),
                            FlSpot(3.4, 5.5),
                            FlSpot(5.1, 4.6),
                            FlSpot(6.8, 4.5),
                            FlSpot(8.5, 3.7),
                            FlSpot(10.2, 3.5),
                          ],
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(
                            show: false,
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: gradientColors
                                  .map((color) => color.withOpacity(0.3))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
                width: 180,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Alarm Here',
                      //'알람: $_hour : $_min',
                      style: TextStyle(
                        fontFamily: 'godo',
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 275,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 80.0),
                //margin: EdgeInsets.fromLTRB(20.0, 10.0, 40.0, 15.0),
                width: 170,
                height: 240,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Diet Here',
                      style: TextStyle(
                        fontFamily: 'godo',
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('S', style: style);
        break;
      case 2:
        text = const Text('M', style: style);
        break;
      case 4:
        text = const Text('T', style: style);
        break;
      case 6:
        text = const Text('W', style: style);
        break;
      case 8:
        text = const Text('T', style: style);
        break;
      case 10:
        text = const Text('F', style: style);
        break;
      case 12:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'godo',
      fontSize: 14.0,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = ' 55';
        break;
      case 3:
        text = ' 60';
        break;
      case 5:
        text = ' 65';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
