import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/Services/weather_model.dart';
import 'package:weather/Services/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;
  WeatherBloc({this.weatherRepo}) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is CityWeatherRequested) {
      print(event.city);
      yield WeatherLoadInProgress();
      try {
        WeatherModel weatherData =
            await WeatherRepo().getCityWeather(event.city);
        print("in cityWeatherLoadSuccess");
        List<Placemark> address =
            await WeatherRepo().getLocationAddress2(weatherData);
        print(address);
        yield WeatherLoadSuccess(weatherData: weatherData, address: address);
      } catch (_) {
        print("in WeatherLoadFail");
        yield WeatherLoadFailure();
      }
    }
    if (event is WeatherRequested) {
      // if (event is WeatherInitial) {
      //   WeatherModel weatherData = await WeatherRepo().getLocationweather();
      //   print("in WeatherLoadSuccess");
      //   yield WeatherLoadSuccess(weatherData: weatherData);
      // }
      yield WeatherLoadInProgress();
      try {
        print("Try");
        WeatherModel weatherData = await WeatherRepo().getLocationweather();
        print("in WeatherLoadSuccess");
        List<Placemark> address = await WeatherRepo().getLocationAddress();
        print(address.first.locality);
        yield WeatherLoadSuccess(weatherData: weatherData, address: address);
      } catch (_) {
        print("in WeatherLoadFail");
        yield WeatherLoadFailure();
      }
    }
    // else {
    //   print("in else of bloc");
    //   yield WeatherLoadInProgress();
    // }
  }
}
