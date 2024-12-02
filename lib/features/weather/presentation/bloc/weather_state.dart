import '../../domain/entities/weather.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  final Duration dayLength;
  final Duration remainingDaylight;

  WeatherLoaded(this.weather, this.dayLength, this.remainingDaylight);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
