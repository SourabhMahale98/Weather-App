import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';

class WeatherList extends StatefulWidget {
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  double defaultSize = SizedConfig.blockSizeVertical;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "Today",
        style:
            TextStyle(fontSize: defaultSize * 2.5, fontWeight: FontWeight.w800),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud),
          SizedBox(width: defaultSize * 2),
          Text("Partially Clouds"),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "33",
            style: TextStyle(
                fontSize: defaultSize * 2.5, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: defaultSize * 1.5),
          Text(
            "30",
            style: TextStyle(
                fontSize: defaultSize * 2.5, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      enabled: true,
    );
  }
}
