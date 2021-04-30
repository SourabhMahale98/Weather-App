import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5562364405868344/6631903449";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  // static String get nativeAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/2247696110";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
}
