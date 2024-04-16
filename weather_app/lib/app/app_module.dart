import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/modules/weather/weather_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: WeatherModule());
  }
}
