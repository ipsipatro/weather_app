import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/utils/data_state.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_state.dart';

import '../../../generate_mock.mocks.dart';

void main() {
  late WeatherBloc weatherBloc;
  late MockGetWeather mockGetWeather;
  late MockCalculateDaylightUseCase mockCalculateDaylightUseCase;

  // Create mock weather data
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
    mockGetWeather = MockGetWeather();
    mockCalculateDaylightUseCase = MockCalculateDaylightUseCase();
    weatherBloc = WeatherBloc(mockGetWeather, mockCalculateDaylightUseCase);
  });

  tearDown(() {
    weatherBloc.close();
  });

  group('WeatherBloc', () {
    const city = 'London';

    test('emits [WeatherLoading, WeatherLoaded] when data is successfully fetched', () async {
      // Arrange: Make the repository return a successful response with the mock data
      when(mockGetWeather.call(city)).thenAnswer((_) async => DataSuccess(mockWeather));
      when(mockCalculateDaylightUseCase.calculateDayLength(mockWeather.sunriseTime, mockWeather.sunsetTime))
          .thenReturn(const Duration(hours: 12));
      when(mockCalculateDaylightUseCase.calculateRemainingDaylight(mockWeather.sunriseTime, mockWeather.sunsetTime))
          .thenReturn(const Duration(hours: 5));

      // Assert: Expect the states to be emitted in the right order with relevant data
      final expectedStates = [
        isA<WeatherLoading>(), // Matching WeatherLoading type
        isA<WeatherLoaded>() // Matching WeatherLoaded type
            .having((state) => (state).weather, 'weather', mockWeather)
            .having((state) => (state).remainingDaylight, 'remainingDaylight', const Duration(hours: 5)),
      ];

      expectLater(weatherBloc.stream, emitsInOrder(expectedStates));

      // Act: Dispatch the event to fetch the weather
      weatherBloc.add(FetchWeatherEvent(city));
    });

    test('emits [WeatherLoading, WeatherError] when there is an error fetching data', () async {
      // Arrange: Make the repository return an error response
      when(mockGetWeather.call(city)).thenAnswer((_) async => const DataError('Failed to fetch weather'));

      // Assert: Expect the states to be emitted in the right order with the relevant data
      final expectedStates = [
        isA<WeatherLoading>(),
        isA<WeatherError>().having((state) => (state).message, 'message', 'Failed to fetch weather'),
      ];

      expectLater(weatherBloc.stream, emitsInOrder(expectedStates));

      // Act: Dispatch the event to fetch the weather
      weatherBloc.add(FetchWeatherEvent(city));
    });
  });
}
