import 'package:equatable/equatable.dart';
import 'package:weather_app/model/weather.dart';

enum WeatherStatus { initial, success, error, loading }

//check status flags
extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isError => this == WeatherStatus.error;
  bool get isLoading => this == WeatherStatus.loading;
}

class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    Weather? curWeather,
    String? message,
  })  : curWeather = curWeather ?? Weather.empty(),
        message = message ?? "Error";

  final Weather curWeather;
  final WeatherStatus status;
  String? message;

  @override
  List<Object?> get props => [status, curWeather, message];

  WeatherState copyWith(
      {Weather? curWeather, WeatherStatus? status, String? message}) {
    return WeatherState(
        curWeather: curWeather ?? this.curWeather,
        status: status ?? this.status,
        message: message ?? this.message);
  }
}
