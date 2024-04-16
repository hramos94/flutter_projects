class Weather {
  final double latitude;
  final double longitude;
  final String cityName;
  final String timeZone;
  final double maxTemperature;
  final double minTemperature;
  final double currentTemp;
  final String humidity;
  final DateTime currentTime;
  final double cloudness;
  final double windSpeed;
  final int preciptation;

  Weather(
      this.cityName,
      this.maxTemperature,
      this.minTemperature,
      this.currentTemp,
      this.humidity,
      this.currentTime,
      this.cloudness,
      this.windSpeed,
      this.preciptation,
      this.latitude,
      this.longitude,
      this.timeZone);
}
