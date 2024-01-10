import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weater_event.dart';

import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/data/provider/weather_provider.dart';

class ErrorHandlerPage extends StatefulWidget {
  String? message;
  ErrorHandlerPage({super.key, this.message});

  @override
  State<ErrorHandlerPage> createState() => _ErrorHandlerPageState();
}

class _ErrorHandlerPageState extends State<ErrorHandlerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSnackBar(widget.message ?? "Something went wrong...\n Try again");
    });
  }

  WeatherProvider provider = WeatherProvider();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherBloc(provider: provider),
        child: Center(
          child: TextButton(
            onPressed: () => {context.read<WeatherBloc>().add(GetWeather())},
            child: const Text("Try again"),
          ),
        ));
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text('Error: $message'),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
