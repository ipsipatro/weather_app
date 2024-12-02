import 'package:dio/dio.dart';
import '../../../../../core/resources/constants.dart';
import '../../models/weather_model.dart';

class WeatherApiService {
  final Dio dio;

  WeatherApiService(this.dio);

  Future<WeatherModel> fetchWeather(String city) async {
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}forecast.json',
        queryParameters: {
          'q': city,
          'days': 1,
          'aqi': 'yes',
          'key': AppConstants.apiKey,
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            throw Exception("Connection timed out. Please try again.");
          case DioExceptionType.receiveTimeout:
            throw Exception("Receive timed out. Please try again.");
          case DioExceptionType.badResponse:
            final statusCode = e.response?.statusCode;
            final errorMessage = e.response?.data['message'] ?? 'Unknown error';
            throw Exception("Error $statusCode: $errorMessage");
          case DioExceptionType.cancel:
            throw Exception("Request to fetch weather was cancelled.");
          case DioExceptionType.unknown:
            throw Exception("An unexpected error occurred: ${e.message}");
          default:
            throw Exception("An unknown error occurred.");
        }
      } else {
        throw Exception("An unexpected error occurred: ${e.toString()}");
      }
    }
  }
}
