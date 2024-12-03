import 'package:mockito/annotations.dart';
import 'package:weather_app/features/weather/data/sources/remote/weather_api_service.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/calculate_daylight.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';

// Generate a mock class for WeatherApiService
@GenerateMocks([WeatherApiService, WeatherRepository, GetWeather, CalculateDaylightUseCase])
void main() {}
