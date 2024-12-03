import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/utils/data_state.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';

import '../../../../generate_mock.mocks.dart';

void main() {
  late GetWeather getWeather;
  late MockWeatherRepository mockWeatherRepository;

  // Create a mock weather model
  final mockWeather = Weather(
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

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeather = GetWeather(mockWeatherRepository);
  });

  group('GetWeather', () {
    const city = 'London';

    test('should return weather data when repository returns data', () async {
      // Arrange: Make the repository return a successful response with the mock data
      when(mockWeatherRepository.getWeather(city)).thenAnswer((_) async => DataSuccess(mockWeather));

      // Act: Call the use case
      final result = await getWeather(city);

      // Assert: Verify the result is a success
      expect(result, equals(DataSuccess(mockWeather)));
      verify(mockWeatherRepository.getWeather(city)).called(1);
    });

    test('should return error when repository returns an error', () async {
      // Arrange: Make the repository return an error response
      when(mockWeatherRepository.getWeather(city)).thenAnswer((_) async => DataError('Failed to fetch weather'));

      // Act: Call the use case
      final result = await getWeather(city);

      // Assert: Verify the result is an error
      expect(result, equals(DataError('Failed to fetch weather')));
      verify(mockWeatherRepository.getWeather(city)).called(1);
    });
  });
}
