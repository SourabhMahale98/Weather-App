import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Services/city_weather_model.dart';
import 'package:weather/Services/weather_model.dart';

const apiKey = '5db2087303ce764550e353595c4258a6';

const openweatherMapURL = "https://api.openweathermap.org/data/2.5/onecall";
//"$openweatherMapURL?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely&appid=$apiKey&units=metric"

class NetworkHelper {
  Future<WeatherModel> getData(double lat, double lon) async {
    print("In Network Helper:$lon and $lat");
    final queryParameters = {
      "lat": "$lat",
      "lon": "$lon",
      "exclude": "minutely",
      "appid": "$apiKey",
      "units": "metric",
    };

    http.Response response = await http.get(Uri.https(
        "api.openweathermap.org", "/data/2.5/onecall", queryParameters));
    print(response.body);
    print("In Network Helper:$lon and $lat");
    print(jsonDecode(response.body));
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        WeatherModel weatherJson = weatherModelFromJson(response.body);
        print(weatherJson.lat);
        return weatherModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<CityWeatherModel> getCity(String city) async {
    final queryParameters = {
      "q": "$city",
      "appid": "$apiKey",
      "units": "metric",
    };
    http.Response response = await http.get(Uri.https(
        "api.openweathermap.org", "/data/2.5/weather", queryParameters));
    print("city weather called");
    print(response.body);
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);

        CityWeatherModel weatherJson = cityWeatherModelFromJson(response.body);
        print(weatherJson.coord.lat);
        return cityWeatherModelFromJson(response.body);
      }
    } catch (e) {
      print("exception in city url");
      print(e);
    }
  }
}
