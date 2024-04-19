import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/app/modules/weather/presenter/stores/weather_store.dart';

class WeatherIcon extends StatelessWidget {
  final WeatherStore store;
  const WeatherIcon({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = store.metricList.first;
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            width: 330,
            child: Stack(children: [
              Observer(builder: (_) {
                return DropdownButton<String>(
                  dropdownColor: Colors.blueAccent,
                  value: store.dropdownValue.isEmpty
                      ? dropdownValue
                      : store.dropdownValue,
                  items: store.metricList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    store.dropdownValue = value!;
                    store.metricUnit(value);
                  },
                );
              }),
              Observer(builder: (_) {
                return Align(
                  alignment: Alignment.center,
                  child: Observer(builder: (_) {
                    return Column(children: [
                      const Icon(
                        Icons.cloud,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        '${store.weatherConverted!.currentTemp.toStringAsFixed(1)} ${store.unit}',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ]);
                  }),
                );
              }),
            ]),
          ),
        ),
      ),
    );
  }
}
