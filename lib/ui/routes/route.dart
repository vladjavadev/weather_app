import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/data/provider/weather_provider.dart';
import 'package:weather_app/ui/screens/details_view.dart';
import 'package:weather_app/ui/screens/home_view.dart';

WeatherProvider provider = WeatherProvider();

var goRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => WeatherBloc(provider: provider),
          child: HomePage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => WeatherBloc(provider: provider),
              child: DetailsPage(),
            );
          },
        ),
      ],
    ),
  ],
);
