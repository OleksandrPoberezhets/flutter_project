import 'package:flutter/material.dart';

class WeatherRow extends StatelessWidget {
  final String text;
  final String value;
  const WeatherRow(this.text, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
