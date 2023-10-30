import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search a City",style:
    TextStyle(fontSize: 25,fontFamily: "Asteru Display"),),centerTitle: true,
      backgroundColor: Colors.blue,)
      ,body:
      Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.white,Colors.lightBlueAccent]
      ,begin: Alignment.bottomLeft,end: Alignment.topRight)
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(

              onSubmitted: (value) async {

              var getWeathercubit=  BlocProvider.of<GetweatherCubit>(context);
              getWeathercubit.fetchWeather(cityName: value);
                Navigator.pop(context);
              },

            decoration: InputDecoration
              (
                contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              labelText: "Search",labelStyle: const TextStyle(fontSize: 25,color: Colors.black,fontFamily: "Trash Talk"),
                hintText: "Enter city name",hintStyle: const TextStyle(fontSize: 20),
                suffixIcon: const Icon(Icons.search,size: 30,),suffixIconColor: Colors.black,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue,width: 10),
                  borderRadius: BorderRadius.circular(16))
              ,focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black87),borderRadius: BorderRadius.circular(16)
                )
            ),
            ),
          ),
        ),
      )
      ,);
  }
}

