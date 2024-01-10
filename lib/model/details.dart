class Details {
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  double windSpeed;
  double gust;

  Details(
      {required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.gust});

  factory Details.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> map = json['main'];
    return Details(
      tempMin: map['temp_min'],
      tempMax: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      windSpeed: json['wind']['speed'],
      gust: json['wind']['gust'] ?? 0,
    );
  }
}
