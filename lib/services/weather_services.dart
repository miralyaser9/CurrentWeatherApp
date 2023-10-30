import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'dart:developer';

class WeatherService{
 Dio dio=Dio();

String baseUrl='https://api.weatherapi.com/v1';
String apiKey="5b1a6a5e3b6e4f83bf9125021233010";

 Future<WeatherModel> getWeather({required String cityName})async {
  try {
   Response response = await dio.get(
       "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
   WeatherModel weatherModel = WeatherModel.fromJson(response.data);

   //print(response.data);

   return weatherModel;
  }
  on DioException catch(e){
    final String errorMessage= e.response?.data["error"]["message"]??"oops,there is an error ,try later";
   throw Exception(errorMessage);

  }
  catch(e){

   log(e.toString());
   throw Exception("oops,there is an error ,try later");
  }

 }


}