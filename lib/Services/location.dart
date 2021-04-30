import 'package:location/location.dart';

class Locations {
  double longitude, latitude;

  Future<LocationData> getCurrentLocation() async {
    print("location");
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("Not service Enabled");
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("Not permission Enabled");
        return null;
      }
    }
    LocationData loc = await location.getLocation();
    return loc;
  }
}
