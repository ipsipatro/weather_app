import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/constants/app_strings.dart';
import 'package:weather_app/core/extensions/date_time_extension.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';
import '../widgets/city_name_widget.dart';
import '../widgets/daylight_info_widget.dart';
import '../widgets/search_field.dart';
import '../widgets/temperature_widget.dart';
import '../widgets/weather_details_widget.dart';
import '../widgets/weather_icon_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          SearchField(searchController: searchController),
          Expanded(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/images/swipe.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        WeatherIconWidget(imageUrl: state.weather.icon),
                        CityNameWidget(
                          cityName: state.weather.cityName,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TemperatureWidget(temperature: '${state.weather.temperature}'),
                        WeatherDetailsWidget(
                          time: state.weather.currentTime.toCustomTimeFormat(),
                          uvIndex: state.weather.uv,
                          rainPercentage: state.weather.chanceOfRain,
                          airQuality: state.weather.aq,
                        ),
                        DaylightInfoWidget(
                          sunriseTimeString: state.weather.sunriseTime,
                          sunsetTimeString: state.weather.sunsetTime,
                          dayLength: state.dayLength,
                          remainingDaylight: state.remainingDaylight,
                        ),
                      ],
                    ),
                  );
                } else if (state is WeatherError) {
                  return Center(
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    AppStrings.initialText,
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
