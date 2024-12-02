import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/domain/usecases/calculate_daylight.dart';

import '../features/weather/data/repositories/weather_repository_impl.dart';
import '../features/weather/data/sources/remote/weather_api_service.dart';
import '../features/weather/domain/usecases/get_weather.dart';
import '../features/weather/presentation/bloc/weather_bloc.dart';

final injector = GetIt.instance;

void setup() {
  injector.registerSingleton(Dio());
  injector.registerSingleton(WeatherApiService(injector<Dio>()));
  injector.registerSingleton(WeatherRepositoryImpl(injector<WeatherApiService>()));
  injector.registerSingleton(GetWeather(injector<WeatherRepositoryImpl>()));
  injector.registerFactory(() => CalculateDaylightUseCase());
  injector.registerFactory(() => WeatherBloc(injector<GetWeather>(), injector<CalculateDaylightUseCase>()));
}
