import 'package:weather/Services/weather_model.dart';
import 'package:weather/sizedconfig.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineGraph extends StatefulWidget {
  LineGraph({this.weatherData});
  final WeatherModel weatherData;
  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff4B85FA).withOpacity(0.9),
    const Color(0xff23b6e6),

    // const Color(0xff02d39a),
    // const Color(0xffFFA500),
    // const Color(0xffFFA500),
    // const Color(0xffE3E3E3),
    // const Color(0xff808080),
  ];
  String readTimestamp(int timestamp) {
    var format = DateFormat('j');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var dates = format.format(date);
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    List<Current> hour = widget.weatherData.hourly;
    double defaultSize = SizedConfig.blockSizeVertical;
    double defaultHorizon = SizedConfig.blockSizeHorizontal;

    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(left: defaultSize * 2.8, right: defaultSize * 3.4),
        child: LineChart(
          LineChartData(
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
                  FlSpot(1, hour[0].temp),
                  FlSpot(2, hour[2].temp),
                  FlSpot(3, hour[5].temp),
                  FlSpot(4, hour[8].temp),
                  FlSpot(5, hour[11].temp),
                  FlSpot(6, hour[14].temp),
                  FlSpot(7, hour[17].temp),
                  FlSpot(8, hour[20].temp),
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
                    fontSize: defaultHorizon * 3.7),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return readTimestamp(hour[0].dt);
                    case 2:
                      return readTimestamp(hour[2].dt);
                    case 3:
                      return readTimestamp(hour[5].dt);
                    case 4:
                      return readTimestamp(hour[8].dt);
                    case 5:
                      return readTimestamp(hour[11].dt);
                    case 6:
                      return readTimestamp(hour[14].dt);
                    case 7:
                      return readTimestamp(hour[17].dt);
                    case 8:
                      return readTimestamp(hour[20].dt);
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
