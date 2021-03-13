import 'package:weather/Components/blur_box.dart';
import 'package:weather/Components/line_graph.dart';
import 'package:weather/Components/measurs.dart';
import 'package:weather/Services/get_weather_data.dart';
import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  GetweatherData getweatherData = GetweatherData();

  int temperature;
  double pressure;
  double wind;
  double humidity;
  double uvIndex;
  String description;
  var weatherImg;
  var weatherData;
  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    print("HI");
    print("HI Sourabh");

    weatherData = await getweatherData.getLocationweather();
    print("$weatherData");

    var temp = weatherData['current']['weather'][0]['icon'];

    var tempURL = "https://openweathermap.org/img/wn/$temp@2x.png";

    weatherImg = Image.network(tempURL, fit: BoxFit.fill, scale: 2);

    setState(() {
      double temp = weatherData['current']['temp'];
      int pre = weatherData['current']['pressure'];
      wind = weatherData['current']['wind_speed'];
      var hum = weatherData['current']['humidity'];
      var uv = weatherData['current']['uvi'];
      description = weatherData['current']['weather'][0]['description'];
      temperature = temp.toInt();
      pressure = pre.toDouble();
      humidity = hum.toDouble();
      uvIndex = uv.toDouble();
    });

    print("Temp : " + "$temperature");
    print("pressure : " + "$pressure");
    print("wind_speed : " + "$wind");
    print("humidity : " + "$humidity");
    print("UVI: " + "$uvIndex");
    print("Desc : " + description);
  }

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double defaultSize = SizedConfig.blockSizeVertical;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/night.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(SizedConfig.blockSizeVertical * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: defaultSize * 3.0),
                  Text(
                    "weatherry",
                    style: TextStyle(
                      fontSize: defaultSize * 5.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, size: defaultSize * 3.0),
                ],
              ),
            ),
            SizedBox(height: defaultSize * 2.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BlurBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nashik",
                          style: TextStyle(
                            fontSize: defaultSize * 4.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "$temperature",
                          style: TextStyle(
                              fontSize: defaultSize * 10.0,
                              fontWeight: FontWeight.w200),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: weatherImg ?? Icon(Icons.cloud),
                            ),
                            SizedBox(width: 5),
                            Text(
                              description ?? "loading",
                              style: TextStyle(
                                fontSize: defaultSize * 2.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: defaultSize * 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Measures(
                          measureText: "UV Index",
                          measureIcon: Icons.wine_bar,
                          measureValue: uvIndex,
                          measureUnit: "",
                        ),
                        Divider(color: Colors.white, height: defaultSize * 1),
                        Measures(
                          measureText: "Wind",
                          measureIcon: Icons.wine_bar,
                          measureValue: wind,
                          measureUnit: "km/h",
                        ),
                        Divider(color: Colors.white, height: defaultSize * 1),
                        Measures(
                          measureText: "Pressure",
                          measureIcon: Icons.wine_bar,
                          measureValue: pressure,
                          measureUnit: "mb",
                        ),
                        Divider(color: Colors.white, height: defaultSize * 1),
                        Measures(
                          measureText: "Humidity",
                          measureIcon: Icons.wine_bar,
                          measureValue: humidity,
                          measureUnit: "%",
                        ),
                        Divider(color: Colors.white, height: defaultSize * 1),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: defaultSize * 3.0),
            Row(
              children: [
                Expanded(
                  flex: 30,
                  child: LineGraph(weatherData: weatherData),
                ),
                Expanded(flex: 1, child: SizedBox(width: 1))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
