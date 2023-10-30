import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/searchpage.dart';
import 'package:weatherapp/widgets/infoweather.dart';
import 'package:weatherapp/widgets/noweather.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
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
       body: BlocBuilder <GetweatherCubit,Weatherstates> (
         builder: (context,state){

         if(state is WeatherinitialState){
           return const No_weather();
         }
         else if(state is Weatherloadedstate){
           return  Infoweather(weather: state.weatherModel,);
         }
         else{
           return const Text("oops, there was an error");
         }
       },)
    );
  }
}
