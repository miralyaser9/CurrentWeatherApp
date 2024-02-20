import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubitss/weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherService):super(WeatherIntial());
  String? cityNamee;

  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityName})async{

    emit(WeatherLoading());
    try{
     weatherModel= await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    }
     on Exception catch(e){
      emit(WeatherFailure());
    }
  }

}