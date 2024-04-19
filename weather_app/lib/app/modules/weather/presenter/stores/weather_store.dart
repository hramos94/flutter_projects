import 'package:mobx/mobx.dart';
import 'package:weather_app/app/modules/weather/domain/entities/weather.dart';
import 'package:weather_app/app/modules/weather/domain/usecase/get_weather.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  final IGetWeather getWeather;

  _WeatherStore(this.getWeather);

  @observable
  Weather? weather;

  @observable
  String metric = 'K';

  @observable
  String dropdownValue = '';

  @observable
  Weather? weatherConverted;

  @observable
  String unit = '';

  @observable
  String velUnit = '';

  List<String> metricList = ['Imperial', 'Celsius'];

  @action
  Future<void> getCompleteWeather() async {
    final double lat = -8.035504;
    final double lon = -34.897035;
    dropdownValue = 'Imperial';
    final request = await getWeather(lat, lon);
    if (request.$2 != null) {
      weather = request.$2;
      metricConverter();
    }
  }

  @action
  void metricUnit(String metricDropDown) {
    dropdownValue = metricDropDown;
    if (dropdownValue == 'Imperial') {
      metric = 'f';
    } else if (dropdownValue == 'Celsius') {
      metric = 'c';
    }
    metricConverter();
  }

  @action
  void metricConverter() {
    if (dropdownValue == 'Celsius') {
      weatherConverted = Weather(
          latitude: weather!.latitude,
          longitude: weather!.longitude,
          maxTemperature: ((5 / 9) * (weather!.maxTemperature - 32)),
          minTemperature: ((5 / 9) * (weather!.minTemperature - 32)),
          currentTemp: ((5 / 9) * (weather!.currentTemp - 32)),
          feelsLikeTemp: ((5 / 9) * (weather!.feelsLikeTemp - 32)),
          pressure: weather!.pressure,
          humidity: weather!.humidity,
          weatherMain: weather!.weatherMain,
          weatherDescription: weather!.weatherDescription,
          cloudness: weather!.cloudness,
          windSpeed: weather!.windSpeed * 2.2369362921,
          preciptationmmh: weather!.preciptationmmh,
          timeZone: weather!.timeZone,
          currentTime: weather!.currentTime,
          cityName: weather!.cityName,
          countryName: weather!.countryName);
      unit = '°C';
      velUnit = 'm/s';
    } else {
      weatherConverted = weather;
      velUnit = 'mph';
      unit = '°F';
    }
  }
}
