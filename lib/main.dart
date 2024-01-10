import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/ui/routes/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Weather',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme:
              const AppBarTheme(color: const Color.fromARGB(255, 14, 79, 133)),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 85, 192, 187),
              background: const Color.fromARGB(255, 148, 200, 243)),

          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(186, 32, 159, 194)),
          )),

          textTheme: TextTheme(
            //set title style
            titleLarge: GoogleFonts.oswald(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
            bodyMedium: GoogleFonts.merriweather(),
          ),
        ),
        routerConfig: goRouter);
  }
}
