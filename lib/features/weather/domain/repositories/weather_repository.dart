import 'package:weather_app/core/utils/data_state.dart';

import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<DataState<Weather>> getWeather(String city);
}
