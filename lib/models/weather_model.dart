import 'package:flutter/foundation.dart';

class WeatherModel{
  final String cityName;
  final DateTime weatherDate;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({ required this.image,required this.cityName,required this.maxTemp,required this.minTemp,required this.temp,required this.weatherCondition,required this.weatherDate});

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        weatherDate: DateTime.parse(json["current"]["last_updated"]),

        cityName: json["location"]["name"],
        maxTemp:json["forecast"]["forecastday"][0]["day"]["maxtemp_c"] ,
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"] );
  }
}
