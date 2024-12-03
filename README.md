# Flutter Weather App 🌦️

A modern weather app built using Flutter 3.24.4, implementing Clean Architecture with Bloc state management.

## Features

- Fetch real-time weather updates for any city.
- Displays sunrise, sunset times, temperature, and weather details.
- Calculates and displays daylight duration and remaining daylight.
- Clean and modular architecture for maintainability and scalability.
- Air Quality Index (AQ): Displays air quality based on the US EPA Index for better understanding of pollution levels.

## Architecture

This project follows the Clean Architecture pattern, ensuring a separation of concerns and modular design. The app is divided into three primary layers:

- Domain
  Contains the core business logic, entities, and use cases.
  Independent of any external dependencies.

- Data
  Responsible for fetching data from APIs and mapping it to domain models.
  Includes the repository implementations and data sources.

- Presentation
  Includes UI screens and widgets built using Flutter.
  Uses Bloc for state management to handle business logic and UI interaction.

## Setup Instructions

- Clone the repository
- Install dependencies using: `flutter pub get`
- Run the app: `fultter run`

## Key Features Implemented

- Clean Architecture: Ensures a clear separation of concerns across layers.
- Bloc State Management: Manages app states in a predictable way.
- Dependency Injection: Using get_it for injecting dependencies across layers.
- Dio for Networking: Efficient HTTP client for fetching weather data.
- Intl for Date/Time Formatting: To format sunrise/sunset times and calculate daylight duration.

## Unit testing

- Mockito is used for mocking dependencies.
- Before running unit tests, please run: `flutter pub run build_runner build`
- Use command `flutter test` to run the tests

# Known Limitations

- The sunrise and sunset view is currently represented using a static image for visual representation. Due to time constraints, a programmatically drawn view using Flutter's canvas or custom painter was not implemented. This feature is planned for future iterations.
