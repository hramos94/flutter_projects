class Weather {
  final double latitude;
  final double longitude;
  final double maxTemperature;
  final double minTemperature;
  final double currentTemp;
  final double feelsLikeTemp;
  final double pressure;
  final String humidity;
  final String weatherMain;
  final String weatherDescription;
  final double cloudness;
  final double windSpeed;
  final double preciptationProbability;
  final double preciptationmmh;
  final String timeZone;
  final DateTime currentTime;
  final String cityName;

  Weather(
      {required this.latitude,
      required this.longitude,
      required this.maxTemperature,
      required this.minTemperature,
      required this.currentTemp,
      required this.feelsLikeTemp,
      required this.pressure,
      required this.humidity,
      required this.weatherMain,
      required this.weatherDescription,
      required this.cloudness,
      required this.windSpeed,
      required this.preciptationProbability,
      required this.preciptationmmh,
      required this.timeZone,
      required this.currentTime,
      required this.cityName});

factory Weather.fromJson(Map<dynamic, dynamic> json) {
  /// returns a weather using data fetched from API
    return Weather(
      latitude: json['coord']['lat'],
      longitude: json['coord']['lon'],
      maxTemperature: json['main']['temp_max'],
      minTemperature: json['main']['temp_min'],
      currentTemp: json['main']['temp'],
      feelsLikeTemp: json['main']['feels_like'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      weatherMain: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      cloudness: json['clouds']['all'],
      windSpeed: json['wind']['speed'],
      preciptationProbability: json['pop'],
      preciptationmmh: json.containsKey('rain') ? json['rain']['3h'] : 0,
      timeZone: json['timezone'],
      currentTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      cityName: json['city']['name'], // maybe deprecated
    );
  }
}