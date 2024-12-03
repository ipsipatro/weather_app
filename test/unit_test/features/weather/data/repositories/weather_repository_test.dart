import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/utils/data_state.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

import '../../../../generate_mock.mocks.dart';

void main() {
  late MockWeatherApiService mockApiService;
  late WeatherRepositoryImpl weatherRepository;

  setUp(() {
    mockApiService = MockWeatherApiService();
    weatherRepository = WeatherRepositoryImpl(mockApiService);
  });

  group('WeatherRepositoryImpl', () {
    const cityName = "London";

    test('should return DataSuccess when fetchWeather succeeds', () async {
      // Arrange
      final mockWeatherModel = WeatherModel(
        cityName: 'London',
        temperature: 15.0,
        description: 'Sunny',
        icon: '//cdn.weatherapi.com/weather/64x64/day/113.png',
        currentTime: DateTime.parse('2024-12-02T14:30:00'),
        sunriseTime: '06:30 AM',
        sunsetTime: '05:00 PM',
        chanceOfRain: '10',
        uv: '3',
        aq: '1',
      );

      when(mockApiService.fetchWeather(cityName)).thenAnswer((_) async => mockWeatherModel);

      // Act
      final result = await weatherRepository.getWeather(cityName);

      // Assert
      expect(result, isA<DataSuccess<Weather>>());
      final success = result as DataSuccess<Weather>;
      expect(success.data.cityName, mockWeatherModel.cityName);
      expect(success.data.temperature, mockWeatherModel.temperature);
    });

    test('should return DataError when fetchWeather throws an exception', () async {
      // Arrange
      when(mockApiService.fetchWeather(cityName)).thenThrow(Exception('Network error'));

      // Act
      final result = await weatherRepository.getWeather(cityName);

      // Assert
      expect(result, isA<DataError>());
      final error = result as DataError;
      expect(error.message, contains('Network error'));
    });
  });
}
