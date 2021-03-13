import 'dart:ui';
import 'package:weather/Components/background.dart';
import 'package:weather/Components/Weather_list.dart';
import 'package:weather/constants.dart';
import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final panalController = PanelController();

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double defaultSize = SizedConfig.blockSizeVertical;
    return Scaffold(
      body: SlidingUpPanel(
        body: Background(),
        controller: panalController,
        panelBuilder: (sc) => buildSlidingPanel(
          sc,
          panalController,
        ),
        maxHeight: defaultSize * 60,
        minHeight: defaultSize * 6,
        color: Colors.transparent,
      ),
    );
  }

  Widget buildSlidingPanel(
      ScrollController sc, PanelController panelController) {
    double defaultSize = SizedConfig.blockSizeVertical;

    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultSize * 6.8),
            topRight: Radius.circular(defaultSize * 6.8),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: gradientBottomDay,
            )),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: defaultSize * 2)),
                Center(
                  child: Text(
                    "More details",
                    style: TextStyle(
                        fontSize: defaultSize * 2.2,
                        letterSpacing: defaultSize * 0.6,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(color: Colors.blue),
                Expanded(
                  child: ListView(
                    controller: sc,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      WeatherList(),
                      WeatherList(),
                      WeatherList(),
                      WeatherList(),
                      WeatherList(),
                      WeatherList(),
                      WeatherList(),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
