import 'package:flutter/material.dart';
import 'package:weather_app/app/modules/weather/presenter/stores/weather_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherStore store;
  const WeatherInfo({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Observer(
          builder: (_) {
            return SizedBox(
              // width: MediaQuery.of(context).size.width,
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.sunny,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Max Temperature',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                      '${store.weatherConverted!.maxTemperature.toStringAsFixed(1)} ${store.unit}',
                                      style:
                                          const TextStyle(color: Colors.white))
                                ],
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.wind_power_outlined,
                                    color: Colors.white),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    const Text('Wind Speed',
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        '${store.weatherConverted!.windSpeed.toStringAsFixed(1)} ${store.velUnit}',
                                        style: const TextStyle(
                                            color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.hot_tub,
                                    color: Colors.white),
                                const SizedBox(
                                  width: 35,
                                ),
                                Column(
                                  children: [
                                    const Text('Feels Like',
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        '${store.weatherConverted!.feelsLikeTemp.toStringAsFixed(1)} ${store.unit}',
                                        style: const TextStyle(
                                            color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Icon(Icons.ac_unit_sharp, color: Colors.white),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const Text('Min Temperature',
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                  '${store.weatherConverted!.minTemperature.toStringAsFixed(1)} ${store.unit}',
                                  style: const TextStyle(color: Colors.white))
                            ],
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          const Icon(Icons.av_timer_outlined, color: Colors.white),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              const Text('Pressure',
                                  style: TextStyle(color: Colors.white)),
                              Text('${store.weatherConverted!.pressure} hPA',
                                  style: const TextStyle(color: Colors.white))
                            ],
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          const Icon(Icons.water, color: Colors.white),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              const Text('Humidity',
                                  style: TextStyle(color: Colors.white)),
                              Text('${store.weatherConverted!.humidity} %',
                                  style: const TextStyle(color: Colors.white))
                            ],
                          ),
                        ])
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
