import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.description,
    required String icon,
    required super.currentTime,
    required super.sunriseTime,
    required super.sunsetTime,
    required super.chanceOfRain,
    required super.uv,
    required super.aq,
  }) : super(
          icon: _buildIconUrl(icon),
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      temperature: json['current']['temp_c'],
      description: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
      currentTime: DateTime.parse(json['location']['localtime']),
      sunriseTime: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunsetTime: json['forecast']['forecastday'][0]['astro']['sunset'],
      uv: json['current']['uv'].toString(),
      aq: json['current']['air_quality']?['us-epa-index']?.toString() ?? "Unknown",
      chanceOfRain: json['forecast']['forecastday'][0]['day']['daily_chance_of_rain'].toString(),
    );
  }

  static String _buildIconUrl(String icon) {
    return 'https:$icon';
  }
}
