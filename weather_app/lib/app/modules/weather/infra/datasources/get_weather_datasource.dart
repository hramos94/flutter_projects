abstract class IGetWeatherDatasource {
  Future<String> getWeather(double latitude, double longitude);
}
