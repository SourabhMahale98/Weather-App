import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather/Screens/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(WeatherMain());
}

class WeatherMain extends StatefulWidget {
  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  // Future<InitializationStatus> _initGoogleMobileAds() {
  //   // Initialize Google Mobile Ads SDK
  //   return MobileAds.instance.initialize();
  // }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> showMeMyToken() async {
    var myToken = await messaging.getToken();
    print("My Token is: " + myToken.toString());
  }

  @override
  void initState() {
    super.initState();

    showMeMyToken();

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoadingPage();
            },
            settings: RouteSettings(
              arguments: value.data,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Message on Foreground: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return LoadingPage();
            },
            settings: RouteSettings(
              arguments: message.data,
            )),
      );
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();

    print("Handling a background message :-): ${message.data}");
    //Here you can do what you want with the message :-)
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.dmSansTextTheme().apply(bodyColor: Colors.white),
      ),
      home: LoadingPage(),
    );
  }
}
