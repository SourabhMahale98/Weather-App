part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadFailure extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final WeatherModel weatherData;
  final List<Placemark> address;
  WeatherLoadSuccess({this.weatherData, this.address});
  @override
  List<Object> get props => [weatherData, address];
}
