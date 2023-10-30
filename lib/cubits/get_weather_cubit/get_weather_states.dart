
import 'package:weatherapp/models/weather_model.dart';

class Weatherstates{}

class WeatherinitialState extends Weatherstates{}

class Weatherloadedstate extends Weatherstates{
  final WeatherModel weatherModel;
  Weatherloadedstate( this.weatherModel);
}

class Weatherfailurestate extends Weatherstates{
  final String errmess;
  Weatherfailurestate({required this.errmess});

}