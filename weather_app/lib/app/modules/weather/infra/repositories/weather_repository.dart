import 'dart:convert';

import 'package:weather_app/app/modules/weather/domain/entities/weather.dart';
import 'package:weather_app/app/modules/weather/domain/errors/errors_weather.dart';
import 'package:weather_app/app/modules/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/weather/infra/adapters/weather_adapter.dart';
import 'package:weather_app/app/modules/weather/infra/datasources/get_weather_datasource.dart';

class WeatherRepository extends IWeatherRepository {
  final IGetWeatherDatasource _getWeatherDatasource;

  WeatherRepository(this._getWeatherDatasource);

  @override
  Future<(IWeatherException?, Weather?)> getWeather(
      double latitude, double longitude) async {
    try {
      final request =
          await _getWeatherDatasource.getWeather(latitude, longitude);
      if (request == null) {
        return (WeatherException('Error to obbtain Weather'), null);
      }
      final weatherJson = jsonDecode(request);
      final weatherAdapted = WeatherAdapter.fromJsonToWeather(weatherJson);
      return (null, weatherAdapted);
    } catch (e) {
      return (WeatherException(e.toString()), null);
    }
  }
}
