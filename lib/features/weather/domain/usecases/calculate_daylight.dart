import 'package:clock/clock.dart';
import 'package:intl/intl.dart';

class CalculateDaylightUseCase {
  final Clock clock;

  CalculateDaylightUseCase({Clock? clock}) : clock = clock ?? const Clock();

  Duration calculateDayLength(String sunriseTime, String sunsetTime) {
    final sunrise = DateFormat("hh:mm a").parse(sunriseTime);
    final sunset = DateFormat("hh:mm a").parse(sunsetTime);

    // Check if sunset is earlier than sunrise and throw a FormatException
    if (sunset.isBefore(sunrise)) {
      throw const FormatException('Sunset time cannot be earlier than sunrise time.');
    }

    return sunset.difference(sunrise);
  }

  Duration calculateRemainingDaylight(String sunriseTime, String sunsetTime) {
    final sunrise = DateFormat("hh:mm a").parse(sunriseTime);
    final sunset = DateFormat("hh:mm a").parse(sunsetTime);
    final currentTime = clock.now();

    if (currentTime.isBefore(sunset) && currentTime.isAfter(sunrise)) {
      return sunset.difference(currentTime);
    }
    return Duration.zero;
  }
}
