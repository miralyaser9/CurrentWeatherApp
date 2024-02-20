import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubitss/weather_cubit.dart';
import 'package:weatherapp/cubitss/weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/views/searchpage.dart';
import 'package:weatherapp/widgets/infoweather.dart';
import 'package:weatherapp/widgets/noweather.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text("weather app",style: TextStyle(fontSize: 30,fontFamily: "Asteru Display",color: Colors.black),),centerTitle: true,
       actions: [
        IconButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return SearchPage();
      }));

         }, icon: const Icon(Icons.search,size: 30,)
    )],
    ),

       body: BlocBuilder <WeatherCubit,WeatherStates> (
         builder: (context,state){

         if(state is WeatherLoading){
           return const Center(child: CircularProgressIndicator());
         }
         else if(state is WeatherSuccess){
         weatherData=  BlocProvider.of<WeatherCubit>(context).weatherModel;
           return  Infoweather(weather: weatherData!,);
         }
         else if(state is WeatherFailure){
           return const Center(child: Text("oops, there was an error"));
         }
         else{
           return const No_weather();

           }
       },)
    );
  }
}
