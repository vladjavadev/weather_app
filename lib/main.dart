import 'package:flutter/material.dart';
import 'package:weather_app/ui/routes/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Weather', routerConfig: goRouter);
  }
}
