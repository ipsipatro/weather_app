import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/domain/usecases/calculate_daylight.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;
  final CalculateDaylightUseCase calculateDaylightUseCase;

  WeatherBloc(this.getWeather, this.calculateDaylightUseCase) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result = await getWeather.call(event.city);

      if (result is DataSuccess<Weather>) {
        final weather = result.data;
        final dayLength = calculateDaylightUseCase.calculateDayLength(
          weather.sunriseTime,
          weather.sunsetTime,
        );
        final remainingDaylight = calculateDaylightUseCase.calculateRemainingDaylight(
          weather.sunriseTime,
          weather.sunsetTime,
        );
        emit(WeatherLoaded(weather, dayLength, remainingDaylight));
      } else if (result is DataError<Weather>) {
        emit(WeatherError(result.message));
      }
    });
  }
}
