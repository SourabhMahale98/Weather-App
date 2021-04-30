import 'dart:ui';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Components/background.dart';
import 'package:weather/Components/weather_list.dart';
import 'package:weather/Services/weather_model.dart';
import 'package:weather/Services/weather_repo.dart';
import 'package:weather/ad_helper.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/constants.dart';
import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with SingleTickerProviderStateMixin {
  double defaultSize = SizedConfig.blockSizeVertical;
  final panalController = PanelController();
  // BannerAd _ad;
  // bool _isAdLoaded = false;
  double dSize;
  @override
  void initState() {
    super.initState();
    // _ad = BannerAd(
    //   adUnitId: AdHelper.bannerAdUnitId,
    //   // factoryId: 'listTile',
    //   request: AdRequest(),
    //   size: AdSize.banner,
    //   listener: AdListener(
    //     onAdLoaded: (_) {
    //       setState(() {
    //         _isAdLoaded = true;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, error) {
    //       // Releases an ad resource when it fails to load
    //       ad.dispose();

    //       print('Ad load failed (code=${error.code} message=${error.message})');
    //     },
    //   ),
    // );
    // _ad.load();
  }

  @override
  void dispose() {
    // _ad?.dispose();
    super.dispose();
  }

  // final AdListener listener = AdListener(
  //   // Called when an ad is successfully received.
  //   onAdLoaded: (Ad ad) => print('Ad loaded.'),
  //   // Called when an ad request failed.
  //   onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //     ad.dispose();
  //     print('Ad failed to load: $error');
  //   },
  //   // Called when an ad opens an overlay that covers the screen.
  //   onAdOpened: (Ad ad) => print('Ad opened.'),
  //   // Called when an ad removes an overlay that covers the screen.
  //   onAdClosed: (Ad ad) => print('Ad closed.'),
  //   // Called when an ad is in the process of leaving the application.
  //   onApplicationExit: (Ad ad) => print('Left application.'),
  //   // Called when a click is recorded for a NativeAd.
  //   onNativeAdClicked: (NativeAd ad) => print('Ad clicked.'),
  //   // Called when an impression is recorded for a NativeAd.
  //   onNativeAdImpression: (NativeAd ad) => print('Ad impression.'),
  // );
  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double defaultSize = SizedConfig.blockSizeVertical;
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Tap back again to leave',
            style: TextStyle(color: Colors.white),
          ),
        ),
        child: BlocProvider(
          create: (context) =>
              WeatherBloc(weatherRepo: WeatherRepo())..add(WeatherRequested()),
          child: SlidingUpPanel(
            body: Background(),
            controller: panalController,
            panelBuilder: (sc) => buildSlidingPanel(
              sc,
              panalController,
            ),
            maxHeight: defaultSize * 60,
            minHeight: defaultSize * 6,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget buildSlidingPanel(
      ScrollController sc, PanelController panelController) {
    double defaultSize = SizedConfig.blockSizeVertical;
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 6.8),
          topRight: Radius.circular(defaultSize * 6.8),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: gradientBottomDay,
          )),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: defaultSize * 1.5)),
              Center(
                child: Text(
                  "More details",
                  style: kMoreDetails,
                ),
              ),
              Divider(color: Colors.blue),
              Expanded(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      WeatherRequested();
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is WeatherLoadFailure) {
                      print("in WeatherLoad Fail");
                      return Center(
                        child: Text("Error while Loading"),
                      );
                    }
                    if (state is WeatherLoadInProgress) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is WeatherLoadSuccess) {
                      List<Daily> data = state.weatherData.daily;
                      return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          // Container(
                          //   child: AdWidget(ad: _ad),
                          //   height: 50,
                          //   width: _ad.size.width.toDouble(),
                          //   alignment: Alignment.center,
                          // ),
                          WeatherList(data: data[0]),
                          WeatherList(data: data[1]),
                          WeatherList(data: data[2]),
                          WeatherList(data: data[3]),
                          WeatherList(data: data[4]),
                          WeatherList(data: data[5]),
                          WeatherList(data: data[6]),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
