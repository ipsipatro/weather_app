// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/constants/app_strings.dart';

import 'package:weather_app/core/theme/app_pallete.dart';
import 'package:weather_app/core/theme/custom_text_style.dart';

class DaylightInfoWidget extends StatelessWidget {
  final String sunriseTimeString;
  final String sunsetTimeString;
  final Duration dayLength;
  final Duration remainingDaylight;

  const DaylightInfoWidget({
    super.key,
    required this.sunriseTimeString,
    required this.sunsetTimeString,
    required this.dayLength,
    required this.remainingDaylight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppPallete.gray50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.sunriseAndSunset, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 32),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 98,
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            AppStrings.sunrise,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 34, top: 15),
                          child: Text(
                            sunriseTimeString,
                            style: CustomTextStyles.bodySmallGray50012,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/sunrise_sunset.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 44),
                          child: Text(
                            AppStrings.sunset,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 34, top: 16),
                          child: Text(
                            sunsetTimeString,
                            style: CustomTextStyles.bodySmallGray50012,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // Length of Day
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.lengthOfDay,
                    style: CustomTextStyles.bodySmallGray500,
                  ),
                  TextSpan(
                    text: '${dayLength.inHours} h ${dayLength.inMinutes % 60} m',
                    style: CustomTextStyles.bodySmallBlueGray900,
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.remainingDaylight,
                    style: CustomTextStyles.bodySmallGray500,
                  ),
                  TextSpan(
                    text: '${remainingDaylight.inHours} h ${remainingDaylight.inMinutes % 60} m',
                    style: CustomTextStyles.bodySmallBlueGray900,
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
