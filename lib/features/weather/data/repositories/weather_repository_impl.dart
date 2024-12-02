import '../../../../core/utils/data_state.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../sources/remote/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<DataState<Weather>> getWeather(String city) async {
    try {
      final result = await apiService.fetchWeather(city);
      return DataSuccess(result);
    } catch (e) {
      return DataError(e.toString());
    }
  }
}
