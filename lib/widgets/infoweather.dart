import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class Infoweather extends StatelessWidget {
  const Infoweather({Key? key, required this.weather, }) : super(key: key);

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel=BlocProvider.of<GetweatherCubit>(context).weatherModel!;


    // if(weatherModel == null){
    //   log("is null");
    // }

    return Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
      getWeatherColor(weatherModel.weatherCondition),
      getWeatherColor(weatherModel.weatherCondition)[300]!,
      getWeatherColor(weatherModel.weatherCondition)[50]!,

    ])
    ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text(weatherModel.cityName,style: const TextStyle(fontFamily :"valveta",fontSize: 40,fontWeight: FontWeight.bold),),

        Text("Updated at : ${weatherModel.weatherDate.hour}:${weatherModel.weatherDate.minute}",style: TextStyle(fontSize: 20),),
      const SizedBox(height: 24,),
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
        Image.network("https:${weatherModel.image}"),

          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(weatherModel.temp.round().toString(),style: const TextStyle(fontSize: 28,fontFamily: "Trash Talk"),),
          ),
        Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [

          Text("Max Temp is ${weatherModel.maxTemp.round()}".toString(),style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
          ,Text("Min Temp is ${weatherModel.minTemp.round()}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
        ],)

      ],
      )
       , const SizedBox(height: 20,)
   ,Text(weatherModel.weatherCondition,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),) ],
      ),
    );
  }
}

