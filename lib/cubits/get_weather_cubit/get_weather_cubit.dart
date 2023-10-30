
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';
import 'get_weather_states.dart';

class GetweatherCubit extends Cubit <Weatherstates> {

  WeatherModel? weatherModel;
 GetweatherCubit():super(WeatherinitialState());

     fetchWeather({required String cityName}) async {
       try {
          weatherModel = await WeatherService().getWeather(cityName: cityName);
         emit(Weatherloadedstate(weatherModel!));
       } catch (e) {
         emit(Weatherfailurestate(errmess: e.toString()));
       }
     }
}