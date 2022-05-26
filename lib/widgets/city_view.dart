import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_project/constants/colors.dart';
import 'package:weather_project/models/weather_forecast_daily.dart';
import 'package:weather_project/utils/forecast.dart';

import 'package:weather_project/widgets/temperature_view.dart';

class CurrentWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CurrentWeather({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    var forecastList = data!.list!;
    var temp = forecastList[0].temp!.day!.toStringAsFixed(0);
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt! * 1000);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      height: MediaQuery.of(context).size.height - 320,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      // color: const Color(0xff00A1FF),
      child: Column(
        children: [
          Text(
            data.city!.name!,
            style: const TextStyle(
              height: 0.1,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Divider(),
          Image(
            image: AssetImage(
              Util.findIcon('${forecastList[0].weather![0].main}', true),
            ),
            color: ColorsConstants.white,
            height: MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '$temp °C',
                          style: const TextStyle(
                            height: 0.1,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${forecastList[0].weather![0].description}',
                          style: const TextStyle(fontSize: 25),
                        ),
                        Text(
                          Util.getFormattedDate(formattedDate),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(color: ColorsConstants.white),
          const SizedBox(height: 10),
          ExtraData(snapshot: snapshot),
        ],
      ),
    );
  }
}
