part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequested extends WeatherEvent {}

class CityWeatherRequested extends WeatherEvent {
  final String city;

  CityWeatherRequested({this.city});
}
