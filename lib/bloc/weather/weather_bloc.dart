import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weater_event.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/data/provider/weather_provider.dart';
import 'package:weather_app/exception/location_service_disabled.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.provider,
  }) : super(WeatherState()) {
    on<GetWeather>(_mapGetWeatherEventToState);
  }
  final WeatherProvider provider;

  void _mapGetWeatherEventToState(
      GetWeather event, Emitter<WeatherState> emit) async {
    //mark state is loading
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      //created timer variable to interrupt long connection
      var timer = Timer(const Duration(seconds: 10),
          () => throw TimeoutException("Host response time has expired"));
      final curWeather = await provider.fetchWeather();
      timer.cancel();
      emit(
        state.copyWith(
          status: WeatherStatus.success,
          curWeather: curWeather,
        ),
      );
    } catch (error) {
      String message = "Something went wrong...\n Try again";

      if (error is TimeoutException) {
        message = "Сonnection time has expired\n Try again";
      } else if (error is GeoLocationServiceDisabled) {
        message = "Enabled geolocation service and try again";
      }

      emit(state.copyWith(status: WeatherStatus.error, message: message));
    }
  }
}
