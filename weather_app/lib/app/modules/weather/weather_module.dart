import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/modules/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/weather/domain/usecase/get_weather.dart';
import 'package:weather_app/app/modules/weather/external/datasources/get_weather_datasource.dart';
import 'package:weather_app/app/modules/weather/infra/datasources/get_weather_datasource.dart';
import 'package:weather_app/app/modules/weather/infra/repositories/weather_repository.dart';
import 'package:weather_app/app/modules/weather/presenter/pages/weather_page.dart';
import 'package:weather_app/app/modules/weather/presenter/stores/weather_store.dart';
import 'package:http/http.dart' as http;

class WeatherModule extends Module {
  @override
  void binds(i) {

    // Stores
    i.addLazySingleton<WeatherStore>(WeatherStore.new);

    // Utils
    i.add(http.Client.new);

    // Datasources
    i.add<IGetWeatherDatasource>(GetWeatherDatasource.new);

    // Repository
    i.add<IWeatherRepository>(WeatherRepository.new);

    // Usecases
    i.add<IGetWeather>(GetWeather.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const WeatherPage());
  }
}
