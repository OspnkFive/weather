import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api/weather_api.dart';
import '../constants/colors.dart';
import 'home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast();
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(locationWeather: weatherInfo);
      }));
    } catch (e) {
      log('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.white,
        body: Center(
          child: SpinKitDoubleBounce(
              color: Color.fromARGB(255, 111, 80, 224), size: 100.0),
        ),
      ),
    );
  }
}
