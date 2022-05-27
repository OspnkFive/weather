import 'package:flutter/material.dart';
import 'package:weather_project/constants/colors.dart';
import 'package:weather_project/widgets/card_forecast.dart';

import '../constants/sizes.dart';
import '../models/weather_forecast_daily.dart';

class ButtomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const ButtomListView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '16 - days weather forecast'.toUpperCase(),
            style: const TextStyle(
              fontSize: FontSize.kMedium,
              fontWeight: FontWeight.bold,
              color: ColorsConstants.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 160,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xff00A1FF).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: forecastCard(snapshot, index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: snapshot.data!.list!.length,
            ),
          )
        ],
      ),
    );
  }
}
