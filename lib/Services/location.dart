import 'package:geolocator/geolocator.dart';

class Location {
  double longitude, latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print("Error While fetcthing Location: $e");
    }
  }
}
