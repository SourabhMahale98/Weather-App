import 'package:weather/Services/location.dart';
import 'package:weather/Services/network_helper.dart';

const apiKey = 'c80c767c671aaac4be49618041447f5a';
const openweatherMapURL = "https://api.openweathermap.org/data/2.5/onecall";

class GetweatherData {
  Future<dynamic> getLocationweather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print("In GetweatherDat: $location");
    NetworkHelper networkHelper = NetworkHelper(
        "$openweatherMapURL?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
