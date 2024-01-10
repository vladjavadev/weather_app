import 'package:weather_app/model/details.dart';

class Weather {
  String? name;
  double? temperature;
  String? description;
  Details? details;
  String? iconUrl;

  Weather.empty();
  Weather(
      {required this.name,
      required this.temperature,
      required this.description,
      required this.iconUrl});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        name: json['name'],
        temperature: json['main']['temp'],
        description: json['weather'][0]['description'],
        iconUrl: json['weather'][0]['icon']);
  }
}
