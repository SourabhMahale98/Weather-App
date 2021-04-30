import 'package:in_app_update/in_app_update.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/Screens/Weather_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _flexibleUpdateAvailable = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  AppUpdateInfo _updateInfo;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  @override
  void initState() {
    super.initState();
    _updateInfo?.updateAvailability == UpdateAvailability.updateAvailable
        ? () {
            InAppUpdate.startFlexibleUpdate().then((_) {
              setState(() {
                _flexibleUpdateAvailable = true;
              });
            }).catchError((e) {
              showSnack(e.toString());
            });
          }
        : null;

    Future.delayed(
        Duration(milliseconds: 5000),
        () => {
              getNextScreen(),
            });

    // }
  }

  void getNextScreen() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => WeatherPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 2000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/icons/star.json',
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/icons/sp.json',
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
