import 'package:weather_app/app/modules/weather/domain/entities/weather.dart';

class WeatherAdapter {
  static Weather fromJsonToWeather(Map data) {
    return Weather.fromJson(data);
  }
}
