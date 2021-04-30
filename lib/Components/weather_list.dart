import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:intl/intl.dart';
import 'package:weather/Services/weather_model.dart';
import 'package:weather/constants.dart';
import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';

class WeatherList extends StatefulWidget {
  final Daily data;
  WeatherList({this.data});
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  double defaultSize = SizedConfig.blockSizeVertical;
  String readTimestamp(int timestamp) {
    var format = DateFormat('E');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var dates = format.format(date);
    return dates;
  }

  DateTime now = DateTime.now();
  // DateTime to = DateTime().;
  @override
  Widget build(BuildContext context) {
    String day = readTimestamp(widget.data.dt);
    //This is just for printing today
    DateFormat format = DateFormat("E");
    DateTime now = DateTime.now();
    var nowDate = format.format(now);
    //upto this.
    return ListTile(
      leading: day == nowDate
          ? Text(
              "Today",
              style: kWeekDays,
            )
          : Text(
              day,
              style: kWeekDays,
            ),
      title: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: defaultSize * 3.5,
                child: Image(
                    image: Svg(
                        "assets/icons/${widget.data.weather.first.icon}.svg")),
              ),
              SizedBox(width: defaultSize * 2),
              Tooltip(
                  message: "Description about Temperature",
                  child: AutoSizeText(widget.data.weather.first.description)),
            ],
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
            message: "Maximum Temperature",
            child: Text(
              widget.data.temp.max.toInt().toString(),
              style: kTemp,
            ),
          ),
          SizedBox(width: defaultSize * 1.5),
          Tooltip(
            message: "Minimum Temperature",
            child: Text(
              widget.data.temp.min.toInt().toString(),
              style: kTemp,
            ),
          ),
        ],
      ),
      enabled: true,
    );
  }
}
