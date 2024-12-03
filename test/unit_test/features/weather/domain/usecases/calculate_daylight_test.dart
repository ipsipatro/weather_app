import 'package:flutter_test/flutter_test.dart';
import 'package:clock/clock.dart';
import 'package:weather_app/features/weather/domain/usecases/calculate_daylight.dart';

void main() {
  late CalculateDaylightUseCase useCase;

  setUp(() {
    // Mock time to 3:30 PM for the use case
    useCase = CalculateDaylightUseCase(clock: Clock.fixed(DateTime(2024, 12, 3, 15, 30)));
  });

  group('CalculateDaylightUseCase', () {
    test('calculateDayLength returns correct duration', () {
      // Arrange
      const sunriseTime = "06:30 AM";
      const sunsetTime = "05:30 PM";

      // Act
      final result = useCase.calculateDayLength(sunriseTime, sunsetTime);

      // Assert
      expect(result, const Duration(hours: 11));
    });

    test('calculateDayLength throws an error for invalid times', () {
      // Arrange
      const sunriseTime = "06:30 PM"; // Invalid, sunset should be later than sunrise
      const sunsetTime = "05:30 AM"; // Invalid, sunset time before sunrise

      // Act & Assert
      expect(
        () => useCase.calculateDayLength(sunriseTime, sunsetTime),
        throwsFormatException,
      );
    });

    test('calculateRemainingDaylight returns zero when after sunset', () {
      // Arrange
      const sunriseTime = "06:30 AM";
      const sunsetTime = "05:30 PM";

      // Mock the current time to 6:30 PM
      useCase = CalculateDaylightUseCase(clock: Clock.fixed(DateTime(2024, 12, 3, 18, 30))); // Mock to 6:30 PM

      // Act
      final result = useCase.calculateRemainingDaylight(sunriseTime, sunsetTime);

      // Assert
      expect(result, Duration.zero);
    });

    test('calculateRemainingDaylight returns zero when before sunrise', () {
      // Arrange
      const sunriseTime = "06:30 AM";
      const sunsetTime = "05:30 PM";

      // Mock the current time to 5:30 AM
      useCase = CalculateDaylightUseCase(clock: Clock.fixed(DateTime(2024, 12, 3, 5, 30))); // Mock to 5:30 AM

      // Act
      final result = useCase.calculateRemainingDaylight(sunriseTime, sunsetTime);

      // Assert
      expect(result, Duration.zero);
    });
  });
}
