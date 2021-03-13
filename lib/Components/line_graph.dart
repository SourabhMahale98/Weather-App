import 'package:weather/sizedconfig.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class LineGraph extends StatefulWidget {
  LineGraph({this.weatherData});
  final weatherData;
  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
    const Color(0xffFFA500),
    const Color(0xffFFA500),
    const Color(0xffE3E3E3),
    const Color(0xff808080),
  ];
  @override
  Widget build(BuildContext context) {
    // var timestamp = widget.weatherData['current']['dt'];
    // timestamp = timestamp * 4;
    // print("Timestamp : " + timestamp.toString());
    // var date = new DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
    // var formattedDate = DateFormat.yMMMd().format(date);
    // print(formattedDate);

    double defaultSize = SizedConfig.blockSizeVertical;

    return Container(
      height: defaultSize * 45,
      child: Padding(
        padding:
            EdgeInsets.only(left: defaultSize * 4.0, right: defaultSize * 3.0),
        child: LineChart(
          LineChartData(
            // minX: 0,
            // maxX: 6,
            // minY: -10,
            // maxY: 50,
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.white.withOpacity(0),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            lineBarsData: [
              LineChartBarData(
                barWidth: 10,
                spots: [
                  FlSpot(1, 17),
                  FlSpot(2, 20),
                  FlSpot(3, 21),
                  FlSpot(4, 23),
                  FlSpot(5, 22),
                  FlSpot(6, 17),
                  FlSpot(7, 15),
                ],
                isCurved: true,
                colors: gradientColors,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.4))
                      .toList(),
                ),
              ),
            ],

            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTextStyles: (value) => TextStyle(
                    color: Color(0xff9d9d9d),
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSize * 2.6),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '6am';
                    case 2:
                      return '9am';
                    case 3:
                      return '12pm';
                    case 4:
                      return '3pm';
                    case 5:
                      return '6pm';
                    case 6:
                      return '9pm';
                    case 7:
                      return '12am';
                    case 8:
                      return '3am';
                  }
                  return '';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
