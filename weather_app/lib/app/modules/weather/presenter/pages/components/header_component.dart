import 'package:flutter/material.dart';
import 'package:weather_app/app/modules/weather/presenter/stores/weather_store.dart';

class HeaderComponent extends StatelessWidget {
  final WeatherStore store;
  const HeaderComponent({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          // width: MediaQuery.of(context).size.width,
          width: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('${store.weatherConverted!.cityName}, ${store.weatherConverted!.countryName}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ]),
              Text('${store.weatherConverted!.currentTime}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
