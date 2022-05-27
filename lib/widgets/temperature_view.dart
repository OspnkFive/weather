import 'package:flutter/cupertino.dart';
import 'package:weather_project/constants/colors.dart';
import 'package:weather_project/models/weather_forecast_daily.dart';

import '../constants/sizes.dart';

class ExtraData extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const ExtraData({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;

    var humidity = forecastList![0].humidity;
    var wind = forecastList[0].speed;
    var rain = forecastList[0].clouds;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(CupertinoIcons.wind, color: ColorsConstants.white),
            const SizedBox(height: 10),
            Text(
              wind.toString() + " Km/h",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: FontSize.kXSmall),
            ),
            const SizedBox(height: 10),
            const Text(
              "Wind",
              style: TextStyle(color: ColorsConstants.kTextColor, fontSize: FontSize.kXSmall),
            )
          ],
        ),
        Column(
          children: [
            const Icon(CupertinoIcons.drop, color: ColorsConstants.white),
            const SizedBox(height: 10),
            Text(
              humidity.toString() + " %",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: FontSize.kXSmall),
            ),
            const SizedBox(height: 10),
            const Text(
              "Humidity",
              style: TextStyle(color: ColorsConstants.kTextColor, fontSize: FontSize.kXSmall),
            )
          ],
        ),
        Column(
          children: [
            const Icon(CupertinoIcons.cloud_rain, color: ColorsConstants.white),
            const SizedBox(height: 10),
            Text(
              rain.toString() + " %",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: FontSize.kXSmall),
            ),
            const SizedBox(height: 10),
            const Text(
              "Rain",
              style: TextStyle(color: ColorsConstants.kTextColor, fontSize:FontSize.kXSmall),
            )
          ],
        )
      ],
    );
  }
}
