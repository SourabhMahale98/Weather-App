import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:weather/Components/blur_box.dart';
import 'package:weather/Components/icon/des_icon_icons.dart';
import 'package:weather/Components/line_graph.dart';
import 'package:weather/Components/measurs.dart';
import 'package:weather/Screens/setting_page.dart';
import 'package:weather/Services/weather_model.dart';
import 'package:weather/Services/weather_repo.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/constants.dart';
import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  WeatherRepo getweatherData = WeatherRepo();
  WeatherBloc myBloc = WeatherBloc();
  int temperature;
  double pressure;
  double wind;
  double humidity;
  double uvIndex;
  String description;
  WeatherModel weatherData;
  TextEditingController myController = TextEditingController();
  String city;
  bool title = true;
  bool _folded = true;
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 2,
    minLaunches: 2,
    remindDays: 5,
    remindLaunches: 5,
    googlePlayIdentifier: 'com.sdm.weatherry',
  );
  @override
  void initState() {
    super.initState();
    rateMyApp.init().then((_) {
      print("RATING 1234567");
      if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showRateDialog(
          context,
          title: 'Rate this app', // The dialog title.
          message:
              'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
          noButton: 'NO THANKS', // The dialog "no" button text.
          laterButton: 'MAYBE LATER', // The dialog "later" button text.
          rateButton: 'RATE', // The dialog "rate" button text.

          listener: (button) {
            // The button click listener (useful if you want to cancel the click event).
            switch (button) {
              case RateMyAppDialogButton.later:
                print('Clicked on "Later".');
                break;
              case RateMyAppDialogButton.no:
                print('Clicked on "No".');
                break;
              case RateMyAppDialogButton.rate:
                print('Clicked on "Rate".');
                break;
            }

            return true; // Return false if you want to cancel the click event.
          },
          ignoreNativeDialog: Platform
              .isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
          dialogStyle: const DialogStyle(), // Custom dialog styles.
          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
          // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
          // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
        );
      }
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String readTimestamp(int timestamp) {
    var format = DateFormat('jm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var dates = format.format(date);
    return dates;
  }

  int locality(state) {
    print("LOcality ${state.address.first.locality}");

    if (state.address.first.locality == "") {
      print("LOcality ${state.address.first.locality}");
      print("administrative area ${state.address.first.administrativeArea}");
      return null;
    }
  }

  var hour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double defaultSize = SizedConfig.blockSizeVertical;
    double defaultHorizon = SizedConfig.blockSizeHorizontal;

    return RefreshIndicator(
      onRefresh: () async {
        // ignore: close_sinks
        BlocProvider.of<WeatherBloc>(context)..add(WeatherRequested());
        Future<String> temp = Future.delayed(Duration(seconds: 4), () {
          return "success";
        });
        return temp;
      },
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: hour > 6 && hour < 18
                ? AssetImage("assets/images/day.png")
                : AssetImage("assets/images/night.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              // WeatherRequested();
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadFailure) {
              print("in WeatherLoad Fail");
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error while Loading \n   City not found"),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<WeatherBloc>(context)
                          ..add(WeatherRequested());
                      },
                      child: Text("Your location's Weather"),
                    ),
                  ],
                ),
              );
            }
            if (state is WeatherLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadSuccess) {
              String iconNo = state.weatherData.current.weather.first.icon;
              print("Icon NO $iconNo");
              if (state.address.first.locality == "") {
                print("LOcality ${state.address.first.locality}");
              }
              return SafeArea(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: defaultSize * 130,
                    minHeight: defaultSize * 110,
                  ),
                  child: ListView(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          title: title
                              ? Text(
                                  "Weatherry",
                                  style: TextStyle(
                                    fontSize: defaultHorizon * 10.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : Text(""),
                          centerTitle: true,
                          leading: IconButton(
                            icon: Icon(Icons.menu),
                            iconSize: defaultHorizon * 7.0,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SettingPage()));
                            },
                          ),
                          actions: [
                            Padding(
                              padding:
                                  EdgeInsets.only(right: defaultHorizon * 2),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                width: _folded
                                    ? defaultHorizon * 13
                                    : defaultHorizon * 80,
                                height: defaultSize * 2,
                                curve: Curves.bounceIn,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(defaultHorizon * 5),
                                  color: !_folded
                                      ? Colors.grey.shade300
                                      : Colors.transparent,
                                  boxShadow: !_folded
                                      ? kElevationToShadow[6]
                                      : kElevationToShadow[0],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: defaultHorizon * 2),
                                        child: !_folded
                                            ? TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                onSubmitted: (myController) {
                                                  String city =
                                                      myController.toString();
                                                  print(city);
                                                  BlocProvider.of<WeatherBloc>(
                                                      context)
                                                    ..add(
                                                      CityWeatherRequested(
                                                          city: city),
                                                    );
                                                },
                                                style: TextStyle(
                                                    color: Colors.black),
                                                controller: myController,
                                                decoration: InputDecoration(
                                                  hintText: 'Search city',
                                                  hintStyle: TextStyle(
                                                      color: Colors.blue[900]),
                                                  border: InputBorder.none,
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                    Container(
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: InkWell(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(_folded
                                                ? defaultHorizon * 3
                                                : 0),
                                            topRight: Radius.circular(
                                                defaultHorizon * 3),
                                            bottomLeft: Radius.circular(_folded
                                                ? defaultHorizon * 3
                                                : 0),
                                            bottomRight: Radius.circular(
                                                defaultHorizon * 3),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: defaultHorizon * 1.5),
                                            child: Icon(
                                              _folded
                                                  ? Icons.search
                                                  : Icons.close,
                                              color: _folded
                                                  ? Colors.white
                                                  : Colors.blue[900],
                                              size: defaultHorizon * 7.0,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _folded = !_folded;
                                              title = !title;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: defaultSize * 80,
                          child: Column(
                            children: [
                              SizedBox(height: defaultSize * 2.0),
                              Expanded(
                                flex: 4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: BlurBox(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.location_pin,
                                                            size: defaultSize *
                                                                2.5),
                                                        SizedBox(
                                                            width: defaultSize *
                                                                1),
                                                        Tooltip(
                                                          message: "Location",
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: AutoSizeText(
                                                              locality(state) ==
                                                                      null
                                                                  ? state
                                                                      .address
                                                                      .first
                                                                      .locality
                                                                  : state
                                                                      .address
                                                                      .first
                                                                      .administrativeArea,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                              minFontSize: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Tooltip(
                                                    message:
                                                        "Today's temperature",
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          state.weatherData
                                                              .current.temp
                                                              .toInt()
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  defaultSize *
                                                                      9.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200),
                                                        ),
                                                        Text(
                                                          " \u2103",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  defaultSize *
                                                                      3.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: defaultSize * 1.8,
                                                        right:
                                                            defaultSize * 1.5),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height:
                                                                defaultSize *
                                                                    3.5,
                                                            child: Image(
                                                                image: Svg(
                                                                    "assets/icons/$iconNo.svg")),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  defaultSize *
                                                                      1),
                                                          Tooltip(
                                                            message:
                                                                "Short Description about today's weather",
                                                            child: AutoSizeText(
                                                              state
                                                                      .weatherData
                                                                      .current
                                                                      .weather[
                                                                          0]
                                                                      .description ??
                                                                  "loading",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    defaultSize *
                                                                        2.5,
                                                              ),
                                                              minFontSize: 18,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: defaultSize * 4,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Measures(
                                              measureText: "UV Index",
                                              measureIcon: Icons.wb_sunny,
                                              measureValue:
                                                  state.weatherData.current.uvi,
                                              measureUnit: "",
                                            ),
                                            divider(),
                                            Measures(
                                              measureText: "Wind",
                                              measureIcon: DesIcon.wind,
                                              measureValue: state.weatherData
                                                      .current.windSpeed
                                                      .roundToDouble() *
                                                  3.6,
                                              measureUnit: "km/h",
                                            ),
                                            divider(),
                                            Measures(
                                              measureText: "Pressure",
                                              measureIcon: Icons.speed_outlined,
                                              measureValue: state
                                                  .weatherData.current.pressure
                                                  .toDouble(),
                                              measureUnit: "hPa",
                                            ),
                                            divider(),
                                            Measures(
                                              measureText: "Humidity",
                                              measureIcon: DesIcon.humidity,
                                              measureValue: state
                                                  .weatherData.current.humidity
                                                  .toDouble(),
                                              measureUnit: "%",
                                            ),
                                            divider(),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(height: defaultSize * 1.0),
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: defaultSize * 49,
                                  width: double.infinity,
                                  child: LineGraph(
                                    weatherData: state.weatherData,
                                  ),
                                ),
                              ),
                              // SizedBox(height: defaultSize * 10.0),
                            ],
                          ),
                        )
                      ]),
                ),
              );
            }
            return Center(child: Text("Error"));
          },
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.white, height: defaultSize * 1);
  }
}
