import 'package:weather_app/app/modules/weather/domain/entities/weather.dart';
import 'package:weather_app/app/modules/weather/domain/errors/errors_weather.dart';
import 'package:weather_app/app/modules/weather/domain/repositories/weather_repository.dart';

abstract class IGetWeather {
  Future<(IWeatherException?, Weather)> call(double latitude, double longitude);
}

class GetWeather implements IGetWeather {
  final IWeatherRepository _weatherRepository;

  GetWeather(this._weatherRepository);

  @override
  Future<(IWeatherException?, Weather)> call(
      double latitude, double longitude) async {
    return await _weatherRepository.getWeather(latitude, longitude);
  }
}
