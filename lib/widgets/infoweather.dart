import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/cubitss/weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class Infoweather extends StatelessWidget {
  const Infoweather({Key? key,   required this.weather, }) : super(key: key);

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
      getWeatherColor(weather.weatherCondition),
      getWeatherColor(weather.weatherCondition)[300]!,
      getWeatherColor(weather.weatherCondition)[50]!,

    ])
    ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text('${BlocProvider.of<WeatherCubit>(context).cityNamee}',style: const TextStyle(fontFamily :"valveta",fontSize: 40,fontWeight: FontWeight.bold),),

        Text("Updated at : ${weather.weatherDate.hour}:${weather.weatherDate.minute}",style: TextStyle(fontSize: 20),),
      const SizedBox(height: 24,),
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
        Image.network("https:${weather.image}"),

          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(weather.temp.round().toString(),style: const TextStyle(fontSize: 28,fontFamily: "Trash Talk"),),
          ),
        Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [

          Text("Max Temp is ${weather.maxTemp.round()}".toString(),style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
          ,Text("Min Temp is ${weather.minTemp.round()}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
        ],)

      ],
      )
       , const SizedBox(height: 20,)
   ,Text(weather.weatherCondition,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),) ],
      ),
    );
  }
}

