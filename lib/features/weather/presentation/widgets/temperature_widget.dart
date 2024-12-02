import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/custom_text_style.dart';

class TemperatureWidget extends StatelessWidget {
  final String temperature;

  const TemperatureWidget({
    super.key,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Text(
            temperature,
            style: CustomTextStyles.poppinsBlueGray900,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              'assets/images/ellipse.svg',
              width: 8,
              height: 8,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
