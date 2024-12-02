class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final DateTime currentTime;
  final String sunriseTime;
  final String sunsetTime;
  final String uv;
  final String aq;
  final String chanceOfRain;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.currentTime,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.uv,
    required this.aq,
    required this.chanceOfRain,
  });
}
