// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_project/utils/location.dart';

import '../constants/constants.dart';
import '../models/weather_forecast_daily.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'APPID': Constants.APP_ID,
        'units': 'metric',
        'q': cityName,
        'cnt': '16',
      };

      parameters = queryParameters;
    } else {
      var queryParameters = {
        'APPID': Constants.APP_ID,
        'units': 'metric',
        'cnt': '16',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };

      parameters = queryParameters;
    }

    var uri = Uri.https(
      Constants.BASE_URL_DOMAIN,
      Constants.FORECAST_PATH,
      parameters,
    );

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Future.error('Erorr response');
    }
  }
}
