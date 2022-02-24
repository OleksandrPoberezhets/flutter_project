import 'package:flutter/material.dart';
import 'package:hello_app/models/weather_info.dart';
import 'package:hello_app/weather_row.dart';
import 'package:hello_app/week_weather_row.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<Future<WeatherInfo>> futureWeekWeatherInfo = [];

  final today = DateTime.now();
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      futureWeekWeatherInfo.add(fetchWeatherInfo(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kyiv"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 240,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: FutureBuilder<WeatherInfo>(
                  future: futureWeekWeatherInfo[0],
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          WeatherRow("Max",
                              "${snapshot.data!.maxTemp.toInt().toString()}°"),
                          WeatherRow("Min",
                              "${snapshot.data!.minTemp.toInt().toString()}°"),
                          WeatherRow("VindSpeed",
                              "${snapshot.data!.windSpeed.toInt().toString()} mph"),
                          WeatherRow("Humidity",
                              "${snapshot.data!.humidity.toInt().toString()}%"),
                          WeatherRow("Visibility",
                              "${snapshot.data!.visibility.toInt().toString()} miles"),
                          WeatherRow("Preasure",
                              "${snapshot.data!.airPressure.toInt().toString()} mb"),
                          WeatherRow("Confidence",
                              "${snapshot.data!.predictability.toInt().toString()}%"),
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            SizedBox(
              height: 310,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  children: futureWeekWeatherInfo.map(
                    (weather) {
                      return FutureBuilder<WeatherInfo>(
                          future: weather,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return WeekWeatherRow(
                                  DateFormat('EEEE')
                                      .format(today.add(Duration(
                                          days: futureWeekWeatherInfo
                                              .indexOf(weather))))
                                      .toString(),
                                  DateFormat('d MMMM')
                                      .format(today.add(Duration(
                                          days: futureWeekWeatherInfo
                                              .indexOf(weather))))
                                      .toString(),
                                  snapshot.data!.weatherStateAbbr,
                                  "${snapshot.data!.minTemp.toInt().toString()}°",
                                  "${snapshot.data!.maxTemp.toInt().toString()}°");
                            } else if (snapshot.hasError) {}
                            return const Center(
                                child: CircularProgressIndicator());
                          });
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ));
  }
}
