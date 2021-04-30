import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:weather/constants.dart';
import 'package:weather/sizedconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String rate =
      'https://play.google.com/store/apps/details?id=com.sdm.weatherry';
  String about = 'https://www.linkedin.com/in/sourabh-mahale-b64759167/';
  String privacy =
      'https://sourabhmahale.blogspot.com/2021/04/privacy-policy.html';
  bool toggled = true;
  double defaultSize = SizedConfig.blockSizeVertical;
  void _rateApp() async => await canLaunch(rate)
      ? await launch(rate)
      : throw 'Could not launch $rate';
  void _aboutApp() async => await canLaunch(about)
      ? await launch(about)
      : throw 'Could not launch $about';

  void _privacyApp() async => await canLaunch(privacy)
      ? await launch(privacy)
      : throw 'Could not launch $privacy';

  Widget divide() {
    return Divider(color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "settings",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: defaultSize * 3.7,
              letterSpacing: 1.5),
        ),
        backgroundColor: Color(0xFF2d3447),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  try {
                    Share.share(
                        'Check out this beautiful And simple to use Weather app named "Weatherry".\n Find Today\'s weather forecast, hourly forecast, and daily forecast for 7 days. https://play.google.com/store/apps/details?id=com.sdm.Weatherry',
                        subject: 'Look what I made!');
                  } catch (e) {
                    print(e);
                  }
                },
                title: Text(
                  'Share Application',
                  style: kDrawerText,
                ),
                leading: Icon(Icons.share),
                subtitle: Text(
                  "share app with your friends and family",
                  style: kDrawerSubText,
                ),
              ),
              divide(),
              ListTile(
                onTap: () {
                  try {
                    _rateApp();
                  } catch (e) {
                    print(e);
                  }
                },
                title: Text(
                  'Rating Application',
                  style: kDrawerText,
                ),
                leading: Icon(Icons.star_rate_sharp),
                subtitle: Text(
                  "Give 5 star rating to support us",
                  style: kDrawerSubText,
                ),
              ),
              divide(),
              ListTile(
                onTap: () {
                  try {
                    _aboutApp();
                  } catch (e) {
                    print(e);
                  }
                },
                title: Text(
                  'About us',
                  style: kDrawerText,
                ),
                leading: Icon(Icons.account_box_outlined),
                subtitle: Text(
                  "Linkdin link to join us",
                  style: kDrawerSubText,
                ),
              ),
              divide(),
              ListTile(
                onTap: () {
                  try {
                    _privacyApp();
                  } catch (e) {
                    print(e);
                  }
                },
                title: Text(
                  'Privacy Policy',
                  style: kDrawerText,
                ),
                leading: Icon(Icons.privacy_tip),
                subtitle: Text(
                  "Glance at privacy policy",
                  style: kDrawerSubText,
                ),
              ),
              divide(),
            ],
          ),
        ),
      ),
    );
  }
}
