// import 'package:geocoder/geocoder.dart';

import 'package:location/location.dart';
import 'package:weather/Services/city_weather_model.dart';
import 'package:weather/Services/location.dart';
import 'package:weather/Services/network_helper.dart';
import 'package:weather/Services/weather_model.dart';
import 'package:geocoding/geocoding.dart';

const apiKey = 'c80c767c671aaac4be49618041447f5a';
const openweatherMapURL = "https://api.openweathermap.org/data/2.5/onecall";

// "$openweatherMapURL?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely&appid=$apiKey&units=metric"
class WeatherRepo {
  Future<WeatherModel> getLocationweather() async {
    LocationData location = await Locations().getCurrentLocation();
    WeatherModel weatherData =
        await NetworkHelper().getData(location.latitude, location.longitude);
    print("Servises are reciving data");
    return weatherData;
  }

  Future<WeatherModel> getCityWeather(String city) async {
    print("City are reciving $city");

    CityWeatherModel cityweatherData = await NetworkHelper().getCity(city);

    double lat = cityweatherData.coord.lat;
    double lon = cityweatherData.coord.lon;
    print(city);
    WeatherModel weatherData = await NetworkHelper().getData(lat, lon);
    print(weatherData);
    print("City are reciving data");
    return weatherData;
  }

  Future<List<Placemark>> getLocationAddress() async {
    LocationData location = await Locations().getCurrentLocation();
    try {
      List<Placemark> addresses =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      return addresses;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Placemark>> getLocationAddress2(WeatherModel weatherData) async {
    try {
      List<Placemark> addresses =
          await placemarkFromCoordinates(weatherData.lat, weatherData.lon);
      return addresses;
    } catch (e) {
      print(e);
    }
  }
}
