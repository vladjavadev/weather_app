import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/consts/weather_api_key.dart';
import 'package:weather_app/model/weather.dart';

class WeatherWidget extends StatefulWidget {
  final Weather? curWeather;
  const WeatherWidget({super.key, required this.curWeather});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String prefixUrl = PREFIX_URL;

  @override
  Widget build(BuildContext context) {
    Weather? curWeather = widget.curWeather!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(curWeather.name ?? "")],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(curWeather.temperature.toString()),
              Image.network("$prefixUrl/${curWeather.iconUrl}.png",
                  width: 60, height: 60)
            ],
          ),
          const SizedBox(height: 20),
          Container(height: 70, child: Text(curWeather.description ?? "")),
          const SizedBox(height: 40),
          TextButton(
              onPressed: () => {context.go('/details')},
              child: Text("Детальніше"))
        ],
      ),
    );
  }
}
