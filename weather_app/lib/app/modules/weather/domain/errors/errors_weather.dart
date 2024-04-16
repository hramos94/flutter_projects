abstract class IWeatherException {
  final String message;
  final StateError? stackTrace;

  IWeatherException(this.message, [this.stackTrace]);
}

class WeatherException extends IWeatherException {
  WeatherException(super.message, [super.stackTrace]);
}
