import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/model/details.dart';

class DetailsWidget extends StatefulWidget {
  Details details;
  DetailsWidget({super.key, required this.details});

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Details details = widget.details;
    return Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _addRow("Мінімальна температура", details.tempMax.toString()),
          _addRow("Максимальна температура", details.tempMax.toString()),
          _addRow("Тиск", details.pressure.toString()),
          _addRow("Вологість", details.humidity.toString()),
          _addRow("Швидкість вітру", details.windSpeed.toString()),
          _addRow("Тумманість", details.gust.toString()),
        ],
      ),
      TextButton(
          onPressed: () => {context.go('/')}, child: Text("Повернутись назад"))
    ]));
  }

  Widget _addRow(String attribute, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(attribute), Text(value)],
      ),
    );
  }
}
