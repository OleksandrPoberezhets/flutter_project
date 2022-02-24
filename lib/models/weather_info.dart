import 'dart:convert';

import 'package:http/http.dart' as http;

Future<WeatherInfo> fetchWeatherInfo(int day) async {
  final response = await http
      .get(Uri.parse('https://www.metaweather.com/api/location/924938/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherInfo.fromJson(jsonDecode(response.body), day);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class WeatherInfo {
  final String weatherStateAbbr;
  final String title;
  final num woeid;
  final num windSpeed;
  final num humidity;
  final num minTemp;
  final num maxTemp;
  final num airPressure;
  final num visibility;
  final num predictability;

  const WeatherInfo({
    required this.woeid,
    required this.weatherStateAbbr,
    required this.title,
    required this.windSpeed,
    required this.humidity,
    required this.minTemp,
    required this.maxTemp,
    required this.airPressure,
    required this.visibility,
    required this.predictability,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json, int day) {
    return WeatherInfo(
        weatherStateAbbr: json["consolidated_weather"][day]
            ['weather_state_abbr'],
        windSpeed: json["consolidated_weather"][day]['wind_speed'],
        humidity: json["consolidated_weather"][day]['humidity'],
        minTemp: json["consolidated_weather"][day]['min_temp'],
        maxTemp: json["consolidated_weather"][day]['max_temp'],
        airPressure: json["consolidated_weather"][day]['air_pressure'],
        visibility: json["consolidated_weather"][day]['visibility'],
        predictability: json["consolidated_weather"][day]['predictability'],
        title: json["title"],
        woeid: json["woeid"]);
  }
}
