import 'package:weather_app/app/modules/weather/domain/errors/errors_weather.dart';
import 'package:weather_app/app/modules/weather/infra/datasources/get_weather_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utils/weather_routes.dart';

class GetWeatherDatasource implements IGetWeatherDatasource {
  final http.Client httpClient;

  GetWeatherDatasource(this.httpClient);

  @override
  Future<String?> getWeather(double latitude, double longitude) async {
    try {
      final uri = Uri.parse(
          '${WeatherRoutes.apiRoute}lat=$latitude&lon=$longitude&appid=${WeatherRoutes.apiKey}');
      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final String data = response.body;
        return data;
      } else {
        return null;
      }
    } catch (err) {
      throw WeatherException('Could not fetch from API');
    }
  }
}
