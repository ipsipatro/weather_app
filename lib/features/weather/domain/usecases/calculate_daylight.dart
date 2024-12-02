import 'package:intl/intl.dart';

class CalculateDaylightUseCase {
  Duration calculateDayLength(String sunriseTime, String sunsetTime) {
    final sunrise = DateFormat("hh:mm a").parse(sunriseTime);
    final sunset = DateFormat("hh:mm a").parse(sunsetTime);
    return sunset.difference(sunrise);
  }

  Duration calculateRemainingDaylight(String sunriseTime, String sunsetTime) {
    final sunrise = DateFormat("hh:mm a").parse(sunriseTime);
    final sunset = DateFormat("hh:mm a").parse(sunsetTime);
    final currentTime = DateTime.now();

    if (currentTime.isBefore(sunset) && currentTime.isAfter(sunrise)) {
      return sunset.difference(currentTime);
    }
    return Duration.zero;
  }
}
