import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }

  static String findIcon(String name, bool type) {
    if (type) {
      switch (name) {
        case "Clouds":
          return "assets/sunny.png";
        case "Rain":
          return "assets/rainy.png";
        case "Drizzle":
          return "assets/rainy.png";
        case "Thunderstorm":
          return "assets/thunder.png";
        case "Snow":
          return "assets/snowy_weather.png";
        default:
          return "assets/sunny.png";
      }
    } else {
      switch (name) {
        case "Clouds":
          return "assets/sunny.png";
        case "Rain":
          return "assets/rainy.png";
        case "Drizzle":
          return "assets/rainy.png";
        case "Thunderstorm":
          return "assets/thunder.png";
        case "Snow":
          return "assets/snowy_weather.png";
        default:
          return "assets/sunny.png";
      }
    }
  }
}
