import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CityNameWidget extends StatelessWidget {
  final String cityName;

  const CityNameWidget({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cityName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          'assets/images/location.svg',
          width: 21,
          height: 21,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
