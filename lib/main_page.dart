import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'feedback.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Duration duration = const Duration(hours: 1, minutes: 23);
  int touchedIndex = -1;
  double _weight = 0.0;
  double _height = 0.0;
  int _hour = 12;
  int _min = 59;
  double _carboHydrate = 0.0;
  double _protein = 0.0;
  double _fat = 0.0;
  int numSuccess = 0;
  int numFail = 0;

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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    width: 250,
                    height: 250,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 5,
                          centerSpaceRadius: 120,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Feedbacks()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 100.0, 0, 80.0),
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 240.0,
                        height: 240.0,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  Container(
                    width: 120,
                    height: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Color.fromARGB(255, 5, 78, 21),
                          size: 13.0,
                        ),
                        Text(
                          '탄수화물: $_carboHydrate',
                          style: TextStyle(
                            fontFamily: 'godo',
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 120,
                    height: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Color.fromARGB(255, 16, 145, 7),
                          size: 13.0,
                        ),
                        Text(
                          '단백질: $_protein',
                          style: TextStyle(
                            fontFamily: 'godo',
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 120,
                    height: 15,
                    child: Row(
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Color.fromARGB(255, 7, 194, 54),
                          size: 13.0,
                        ),
                        Text(
                          '지방: $_fat',
                          style: TextStyle(
                            fontFamily: 'godo',
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
            //margin: EdgeInsets.fromLTRB(20.0, 10.0, 40.0, 15.0),
            width: 370,
            height: 70,
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
                  '성공: $numSuccess  |  실패: $numFail',
                  style: TextStyle(
                    fontFamily: 'godo',
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: 180,
                    child: Flexible(
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
                  ),
                  GestureDetector(
                    onTap: () => EnterUserInfo(),
                    child: Container(
                      //padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                      width: 180,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // 이게 Text()들을 수직방향으로 중앙 정렬
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
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 80.0),
                    //margin: EdgeInsets.fromLTRB(20.0, 10.0, 40.0, 15.0),
                    width: 170,
                    height: 180,
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

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final radius = 5.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 5, 78, 21),
            value: 40,
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 16, 145, 7),
            value: 30,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Color.fromARGB(255, 7, 194, 54),
            value: 30,
            title: '',
            radius: radius,
          );

        default:
          throw Error();
      }
    });
  }

  void EnterUserInfo() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text(
                  "몸무게/신장 수정",
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 39, 39),
                    fontFamily: 'godo',
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  cursorColor: Color.fromARGB(255, 9, 162, 37),
                  decoration: InputDecoration(
                    labelText: '몸무게 입력: ',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 39, 39, 39),
                      fontFamily: 'godo',
                      fontSize: 17.0,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 9, 162, 37),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  cursorColor: Color.fromARGB(255, 9, 162, 37),
                  decoration: InputDecoration(
                    labelText: '신장 입력: ',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 39, 39, 39),
                      fontFamily: 'godo',
                      fontSize: 17.0,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 9, 162, 37),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: new Text(
                  "확인",
                  style: TextStyle(
                    color: Color.fromARGB(255, 9, 162, 37),
                    fontFamily: 'godo',
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
