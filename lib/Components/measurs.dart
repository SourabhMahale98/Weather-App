import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';

class Measures extends StatelessWidget {
  Measures({
    this.measureText,
    this.measureIcon,
    this.measureValue,
    this.measureUnit,
  });
  final String measureText;
  final IconData measureIcon;
  final double measureValue;
  final String measureUnit;
  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double defaultSize = SizedConfig.blockSizeVertical;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$measureText",
          style: TextStyle(
            fontSize: defaultSize * 2.3,
            color: Color(0xffE3E3E3),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Icon(
                measureIcon,
                size: defaultSize * 2.5,
              ),
              Text(
                "  $measureValue",
                style: TextStyle(
                  fontSize: defaultSize * 2.5,
                ),
              ),
              Text(
                " $measureUnit",
                style: TextStyle(
                  fontSize: defaultSize * 2.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
