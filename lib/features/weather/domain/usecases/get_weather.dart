import 'package:weather_app/core/utils/data_state.dart';

import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<DataState<Weather>> call(String city) async {
    return repository.getWeather(city);
  }
}
