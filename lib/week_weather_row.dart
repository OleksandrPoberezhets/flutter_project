import 'package:flutter/material.dart';

class WeekWeatherRow extends StatelessWidget {
  String day;
  String date;
  String weather;
  String temp_min;
  String temp_max;
  WeekWeatherRow(
      this.day, this.date, this.weather, this.temp_min, this.temp_max,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: Colors.white12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                "https://www.metaweather.com/static/img/weather/png/64/$weather.png",
                width: 35.0,
                height: 35.0,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " $date",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    " $day",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "$temp_min/$temp_max",
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
