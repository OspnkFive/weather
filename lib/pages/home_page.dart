// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/api/weather_api.dart';
import 'package:weather_project/constants/colors.dart';
import 'package:weather_project/pages/search_page.dart';
import 'package:weather_project/widgets/bottom_list_view.dart';
import 'package:weather_project/widgets/city_view.dart';

import '../constants/sizes.dart';
import '../models/weather_forecast_daily.dart';

class HomePage extends StatefulWidget {
  final WeatherForecast? locationWeather;

  const HomePage({Key? key, required this.locationWeather}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherForecast> weatherObj;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      weatherObj = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: <Widget>[
        Image.asset(
          "assets/bg.webp",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                setState(() {
                  weatherObj = WeatherApi().fetchWeatherForecast();
                });
              },
              child: const Icon(
                CupertinoIcons.location_circle,
                color: ColorsConstants.white,
                size: 30,
              ),
            ),
            title: Text(
              'Weather app',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.kSmall),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  var tappedName = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }));
                  if (tappedName != null) {
                    setState(() {
                      _cityName = tappedName;
                      weatherObj = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName,
                        isCity: true,
                      );
                    });
                  }
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: ColorsConstants.white,
                  size: 30,
                ),
              )
            ],
          ),
          body: ListView(
            children: [
              FutureBuilder<WeatherForecast>(
                future: weatherObj,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        CurrentWeather(snapshot: snapshot),
                        ButtomListView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return const Center(
                        child: Text(
                      'City not found\n Please enter correct city',
                      style:
                          TextStyle(fontSize: FontSize.kLarge, color: ColorsConstants.white),
                      textAlign: TextAlign.center,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
