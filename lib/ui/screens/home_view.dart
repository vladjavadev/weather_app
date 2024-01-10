import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weater_event.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/ui/screens/error_handler_view.dart';
import 'package:weather_app/ui/widgets/home/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Directionality(
        textDirection: TextDirection.ltr, // or TextDirection.rtl
        child: Scaffold(
          appBar: AppBar(
            title: Text('Weather'),
          ),
          body: Center(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state.status.isInitial || state.status.isLoading) {
                  weatherBloc.add(GetWeather());
                  return const CircularProgressIndicator();
                } else if (state.status.isSuccess) {
                  return WeatherWidget(curWeather: state.curWeather);
                } else {
                  return ErrorHandlerPage(message: state.message);
                }
              },
            ),
          ),
        ));
  }
}
