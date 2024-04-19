import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/modules/weather/presenter/pages/components/header_component.dart';
import 'package:weather_app/app/modules/weather/presenter/pages/components/weather_icon_component.dart';
import 'package:weather_app/app/modules/weather/presenter/pages/components/weather_info_component.dart';
import 'dart:math' as math;
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:weather_app/app/modules/weather/presenter/stores/weather_store.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherStore store;

  @override
  void initState() {
    super.initState();
    store = context.read<WeatherStore>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getApiData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.transparent,
              value: null,
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: null,
                  borderRadius: BorderRadius.zero,
                  gradient: LinearGradient(
                      transform: const GradientRotation(math.pi / 2),
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade200,
                        const Color.fromARGB(255, 92, 182, 255),
                        const Color.fromARGB(255, 27, 27, 27)
                      ]),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Observer(builder: (_) {
                      return Column(
                        children: [
                          Align(alignment: const AlignmentDirectional(-0.73, 0),
                            child: InkWell(onTap: () {
                              FirebaseAuth.instance.signOut();
                              Modular.to.navigate('/');
                            },
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber.shade100),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'Sign Out',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          HeaderComponent(
                            store: store,
                          ),
                          WeatherIcon(store: store),
                          WeatherInfo(store: store),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future getApiData() async {
    return Future.value(store.getCompleteWeather());
  }
}
