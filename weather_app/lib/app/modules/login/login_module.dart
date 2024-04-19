import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/modules/login/presenter/pages/login_page.dart';
import 'package:weather_app/app/modules/login/presenter/pages/sign_up_page.dart';
import 'package:weather_app/app/modules/weather/weather_module.dart';


class LoginModule extends Module {
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/signup', child: (context) => const SignUpPage());
    r.module('/weather', module: WeatherModule());
  }
}
