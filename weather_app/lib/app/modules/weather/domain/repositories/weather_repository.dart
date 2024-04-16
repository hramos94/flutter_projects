import 'package:weather_app/app/modules/weather/domain/entities/weather.dart';
import 'package:weather_app/app/modules/weather/domain/errors/errors_weather.dart';

abstract class IWeatherRepository {
  Future<(IWeatherException?, Weather)> getWeather(
      double latitude, double longitude);
}
