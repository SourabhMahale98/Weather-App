import 'package:flutter/widgets.dart';

class SizedConfig {
  static MediaQueryData _mediaQuery;
  static double screenHeight;
  static double screenWidth;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenHeight = _mediaQuery.size.height;
    screenWidth = _mediaQuery.size.width;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    orientation = _mediaQuery.orientation;
  }
}
