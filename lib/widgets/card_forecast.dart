import 'package:flutter/material.dart';
import 'package:weather_project/constants/colors.dart';

import '../utils/forecast.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0]; // Tue
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '$tempMin °C',
        style: const TextStyle(color: ColorsConstants.white, fontSize: 20),
      ),
      Image(
        image: AssetImage(
          Util.findIcon('${forecastList[index].weather![0].main}', false),
        ),
        width: 55,
        height: 55,
        color: ColorsConstants.white,
      ),
      Text(
        dayOfWeek,
        style: const TextStyle(color: ColorsConstants.white, fontSize: 20),
      )
    ],
  );
}
