import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }


  
