import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_strings.dart';
import 'package:weather_app/core/theme/app_pallete.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final String time;
  final String uvIndex;
  final String rainPercentage;
  final String airQuality;

  const WeatherDetailsWidget({
    super.key,
    required this.time,
    required this.uvIndex,
    required this.rainPercentage,
    required this.airQuality,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.gray50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailItem(AppStrings.time, time, context),
            _buildDetailItem(AppStrings.uv, uvIndex, context),
            _buildDetailItem(AppStrings.rain, '$rainPercentage %', context),
            _buildDetailItem(AppStrings.aq, airQuality, context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 5),
        Text(value, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
