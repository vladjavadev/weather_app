import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/consts/weather_api_key.dart';
import 'package:weather_app/model/details.dart';

import 'dart:convert';

import 'package:weather_app/model/weather.dart';
import 'package:weather_app/utils/location_util.dart';

class WeatherProvider with ChangeNotifier {
  Weather? curWeather;
  Details? details;
  LocationUtil locUtil = LocationUtil();

  Future<Weather?> fetchWeather() async {
    Map<String, double> location = await locUtil.getLocation();
    //interpolating string to substitution key and location values
    String url =
        'https://api.openweathermap.org/data/2.5/weather?appid=${OPENWEATHER_API_KEY}&lat=${location['latitude']}&lon=${location['longitude']}&units=metric&lang=ua';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonList = json.decode(response.body);
      //mapping values
      curWeather = Weather.fromJson(jsonList);
      details = Details.fromJson(jsonList);
      curWeather?.details = details;
      notifyListeners();
      return curWeather;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
