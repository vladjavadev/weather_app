import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weater_event.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/ui/widgets/details/details_widget.dart';
import 'package:weather_app/ui/screens/error_handler_view.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Weather Details")),
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state.status.isInitial || state.status.isLoading) {
            weatherBloc.add(GetWeather());
            return const CircularProgressIndicator();
          } else if (state.status.isSuccess) {
            return DetailsWidget(details: state.curWeather.details!);
          } else {
            return ErrorHandlerPage(message: state.message);
          }
        }));
  }
}
