// class WeatherModel {
//   double lat;
//   double lon;
//   String timezone;
//   int timezoneOffset;
//   Current current;
//   List<Hourly> hourly;
//   List<Daily> daily;

//   WeatherModel(
//       {this.lat,
//       this.lon,
//       this.timezone,
//       this.timezoneOffset,
//       this.current,
//       this.hourly,
//       this.daily});

//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lon = json['lon'];
//     timezone = json['timezone'];
//     timezoneOffset = json['timezone_offset'];
//     current =
//         json['current'] != null ? new Current.fromJson(json['current']) : null;
//     if (json['hourly'] != null) {
//       hourly = <Hourly>[];
//       json['hourly'].forEach((v) {
//         hourly.add(new Hourly.fromJson(v));
//       });
//     }
//     if (json['daily'] != null) {
//       daily = <Daily>[];
//       json['daily'].forEach((v) {
//         daily.add(new Daily.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lon'] = this.lon;
//     data['timezone'] = this.timezone;
//     data['timezone_offset'] = this.timezoneOffset;
//     if (this.current != null) {
//       data['current'] = this.current.toJson();
//     }
//     if (this.hourly != null) {
//       data['hourly'] = this.hourly.map((v) => v.toJson()).toList();
//     }
//     if (this.daily != null) {
//       data['daily'] = this.daily.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Current {
//   int dt;
//   int sunrise;
//   int sunset;
//   double temp;
//   double feelsLike;
//   int pressure;
//   int humidity;
//   double dewPoint;
//   double uvi;
//   double clouds;
//   int visibility;
//   double windSpeed;
//   int windDeg;
//   List<Weather> weather;

//   Current(
//       {this.dt,
//       this.sunrise,
//       this.sunset,
//       this.temp,
//       this.feelsLike,
//       this.pressure,
//       this.humidity,
//       this.dewPoint,
//       this.uvi,
//       this.clouds,
//       this.visibility,
//       this.windSpeed,
//       this.windDeg,
//       this.weather});

//   Current.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     dewPoint = json['dew_point'];
//     uvi = json['uvi'];
//     clouds = json['clouds'];
//     visibility = json['visibility'];
//     windSpeed = json['wind_speed'];
//     windDeg = json['wind_deg'];
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather.add(new Weather.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     data['sunrise'] = this.sunrise;
//     data['sunset'] = this.sunset;
//     data['temp'] = this.temp;
//     data['feels_like'] = this.feelsLike;
//     data['pressure'] = this.pressure;
//     data['humidity'] = this.humidity;
//     data['dew_point'] = this.dewPoint;
//     data['uvi'] = this.uvi;
//     data['clouds'] = this.clouds;
//     data['visibility'] = this.visibility;
//     data['wind_speed'] = this.windSpeed;
//     data['wind_deg'] = this.windDeg;
//     if (this.weather != null) {
//       data['weather'] = this.weather.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Weather {
//   int id;
//   String main;
//   String description;
//   String icon;

//   Weather({this.id, this.main, this.description, this.icon});

//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['main'] = this.main;
//     data['description'] = this.description;
//     data['icon'] = this.icon;
//     return data;
//   }
// }

// class Hourly {
//   int dt;
//   double temp;
//   double feelsLike;
//   int pressure;
//   int humidity;
//   double dewPoint;
//   double uvi;
//   double clouds;
//   int visibility;
//   double windSpeed;
//   int windDeg;
//   List<Weather> weather;
//   int pop;

//   Hourly(
//       {this.dt,
//       this.temp,
//       this.feelsLike,
//       this.pressure,
//       this.humidity,
//       this.dewPoint,
//       this.uvi,
//       this.clouds,
//       this.visibility,
//       this.windSpeed,
//       this.windDeg,
//       this.weather,
//       this.pop});

//   Hourly.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     dewPoint = json['dew_point'];
//     uvi = json['uvi'];
//     clouds = json['clouds'];
//     visibility = json['visibility'];
//     windSpeed = json['wind_speed'];
//     windDeg = json['wind_deg'];
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather.add(new Weather.fromJson(v));
//       });
//     }
//     pop = json['pop'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     data['temp'] = this.temp;
//     data['feels_like'] = this.feelsLike;
//     data['pressure'] = this.pressure;
//     data['humidity'] = this.humidity;
//     data['dew_point'] = this.dewPoint;
//     data['uvi'] = this.uvi;
//     data['clouds'] = this.clouds;
//     data['visibility'] = this.visibility;
//     data['wind_speed'] = this.windSpeed;
//     data['wind_deg'] = this.windDeg;
//     if (this.weather != null) {
//       data['weather'] = this.weather.map((v) => v.toJson()).toList();
//     }
//     data['pop'] = this.pop;
//     return data;
//   }
// }

// class Daily {
//   int dt;
//   int sunrise;
//   int sunset;
//   Temp temp;
//   FeelsLike feelsLike;
//   int pressure;
//   int humidity;
//   double dewPoint;
//   int windSpeed;
//   double windDeg;
//   List<Weather> weather;
//   double clouds;
//   double pop;
//   double uvi;

//   Daily(
//       {this.dt,
//       this.sunrise,
//       this.sunset,
//       this.temp,
//       this.feelsLike,
//       this.pressure,
//       this.humidity,
//       this.dewPoint,
//       this.windSpeed,
//       this.windDeg,
//       this.weather,
//       this.clouds,
//       this.pop,
//       this.uvi});

//   Daily.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//     temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
//     feelsLike = json['feels_like'] != null
//         ? new FeelsLike.fromJson(json['feels_like'])
//         : null;
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     dewPoint = json['dew_point'];
//     windSpeed = json['wind_speed'];
//     windDeg = json['wind_deg'];
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather.add(new Weather.fromJson(v));
//       });
//     }
//     clouds = json['clouds'];
//     pop = json['pop'];
//     uvi = json['uvi'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     data['sunrise'] = this.sunrise;
//     data['sunset'] = this.sunset;
//     if (this.temp != null) {
//       data['temp'] = this.temp.toJson();
//     }
//     if (this.feelsLike != null) {
//       data['feels_like'] = this.feelsLike.toJson();
//     }
//     data['pressure'] = this.pressure;
//     data['humidity'] = this.humidity;
//     data['dew_point'] = this.dewPoint;
//     data['wind_speed'] = this.windSpeed;
//     data['wind_deg'] = this.windDeg;
//     if (this.weather != null) {
//       data['weather'] = this.weather.map((v) => v.toJson()).toList();
//     }
//     data['clouds'] = this.clouds;
//     data['pop'] = this.pop;
//     data['uvi'] = this.uvi;
//     return data;
//   }
// }

// class Temp {
//   double day;
//   double min;
//   double max;
//   double night;
//   double eve;
//   double morn;

//   Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

//   Temp.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     min = json['min'];
//     max = json['max'];
//     night = json['night'];
//     eve = json['eve'];
//     morn = json['morn'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     data['min'] = this.min;
//     data['max'] = this.max;
//     data['night'] = this.night;
//     data['eve'] = this.eve;
//     data['morn'] = this.morn;
//     return data;
//   }
// }

// class FeelsLike {
//   double day;
//   double night;
//   double eve;
//   double morn;

//   FeelsLike({this.day, this.night, this.eve, this.morn});

//   FeelsLike.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     night = json['night'];
//     eve = json['eve'];
//     morn = json['morn'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     data['night'] = this.night;
//     data['eve'] = this.eve;
//     data['morn'] = this.morn;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Current> hourly;
  List<Daily> daily;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        lat: json["lat"],
        lon: json["lon"],
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.windSpeed,
    this.weather,
  });

  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  double windSpeed;
  List<Weather> weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "wind_speed": windSpeed,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Weather {
  Weather({this.id, this.main, this.description, this.icon});

  int id;
  dynamic main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainValues.map[json["main"]],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainValues.reverse[main],
        "description": descriptionValues.reverse[description],
      };
}

enum Description {
  OVERCAST_CLOUDS,
  BROKEN_CLOUDS,
  CLEAR_SKY,
  SCATTERED_CLOUDS,
  FEW_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Ico {
  THE_04_D,
  THE_01_D,
  THE_03_D,
  THE_04_N,
  THE_02_D,
  THE_02_N,
  THE_01_N
}

final icoValues = EnumValues({
  "01d": Ico.THE_01_D,
  "01n": Ico.THE_01_N,
  "02d": Ico.THE_02_D,
  "02n": Ico.THE_02_N,
  "03d": Ico.THE_03_D,
  "04d": Ico.THE_04_D,
  "04n": Ico.THE_04_N
});

enum Main { CLOUDS, CLEAR }

final mainValues = EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS});

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.weather,
    this.clouds,
    this.uvi,
  });

  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  List<Weather> weather;
  int clouds;
  double uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        uvi: json["uvi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "uvi": uvi,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
