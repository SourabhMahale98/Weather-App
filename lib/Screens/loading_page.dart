import 'package:weather/Screens/Weather_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getNextScreen();
  }

  void getNextScreen() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WeatherPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
