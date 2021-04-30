import 'package:flutter/material.dart';
import 'package:weather/sizedconfig.dart';

double defaultSize = SizedConfig.blockSizeVertical;
double defaultHorizon = SizedConfig.blockSizeHorizontal;

TextStyle kWeatherName = TextStyle(
  fontSize: defaultHorizon * 10.0,
  fontWeight: FontWeight.bold,
);

TextStyle kDrawerText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: defaultSize * 3);

TextStyle kDrawerSubText =
    TextStyle(color: Colors.white, fontSize: defaultSize * 2);

TextStyle kMoreDetails = TextStyle(
    fontSize: defaultSize * 2.2,
    letterSpacing: defaultSize * 0.6,
    fontWeight: FontWeight.bold);

TextStyle kWeekDays =
    TextStyle(fontSize: defaultSize * 2.5, fontWeight: FontWeight.w800);

TextStyle kTemp =
    TextStyle(fontSize: defaultSize * 2.5, fontWeight: FontWeight.w600);

List<Color> gradientText = [
  const Color(0xff4B85FA),
  const Color(0xff3547DC),
];
List<Color> gradientBottomDay = [
  const Color(0xff3547DC).withOpacity(0.9),
  const Color(0xff4B85FA).withOpacity(0.9),
  const Color(0xff4B85FA).withOpacity(0.9),
  const Color(0xff4B85FA).withOpacity(0.9),
  const Color(0xff4B85FA).withOpacity(0.9),
  const Color(0xff3547DC).withOpacity(0.9),
];
