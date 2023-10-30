import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/homepage.dart';
import 'package:weatherapp/views/splash_screen.dart';
import 'package:weatherapp/widgets/noweather.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetweatherCubit(),

        child: Builder(builder: (context) =>
            BlocBuilder<GetweatherCubit, Weatherstates>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(primarySwatch: getWeatherColor(

                      BlocProvider
                          .of<GetweatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition
                  )),
                  debugShowCheckedModeBanner: false,
                  home:Splash(),


                );
              },
            ))
    );
  }

}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.yellow;
    case "Partly cloudy":
      return Colors.orange;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.grey;
    case "Mist":
      return Colors.grey;
    case "Rain":
      return Colors.lightBlue;
    case "Snow":
      return Colors.blueGrey;
    case "Sleet":
      return Colors.blueGrey;
    case "Freezing drizzle":
      return Colors.blueGrey;
    case "Thundery outbreaks":
      return Colors.deepPurple;
  // case "Blowing snow":
  //   return Colors.white;
  // case "Blizzard":
  //   return Colors.white;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.grey;
    case "Light drizzle":
      return Colors.lightBlue;
    case "Freezing drizzle":
      return Colors.lightBlue;
    case "Heavy freezing drizzle":
      return Colors.lightBlue;
    case "Patchy light rain":
      return Colors.lightBlue;
    case "Light rain":
      return Colors.lightBlue;
    case "Moderate rain at times":
      return Colors.lightBlue;
    case "Moderate rain":
      return Colors.lightBlue;
    case "Heavy rain at times":
      return Colors.lightBlue;
    case "Heavy rain":
      return Colors.lightBlue;
    case "Light freezing rain":
      return Colors.lightBlue;
    case "Moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "Light sleet":
      return Colors.lightBlue;
    case "Moderate or heavy sleet":
      return Colors.lightBlue;
    case "Patchy light snow":
      return Colors.blueGrey;
    case "Light snow":
      return Colors.blueGrey;
    case "Patchy moderate snow":
      return Colors.blueGrey;
    case "Moderate snow":
      return Colors.blueGrey;
    case "Patchy heavy snow":
      return Colors.blueGrey;
    case "Heavy snow":
      return Colors.blueGrey;
    case "Ice pellets":
      return Colors.lightBlue;
    case "Light rain shower":
      return Colors.lightBlue;
    case "Moderate or heavy rain shower":
      return Colors.lightBlue;
    case "Torrential rain shower":
      return Colors.lightBlue;
    case "Light sleet showers":
      return Colors.lightBlue;
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "Light snow showers":
      return Colors.blueGrey;
    case "Moderate or heavy snow showers":
      return Colors.blueGrey;
    case "Light showers of ice pellets":
      return Colors.blueGrey;
    case "Moderate or heavy showers of ice pellets":
      return Colors.blueGrey;
    case "Patchy light rain with thunder":
      return Colors.yellow;
    case "Moderate or heavy rain with thunder":
      return Colors.orange;
    case "Patchy light snow with thunder":
      return Colors.blueGrey;
    case "Moderate or heavy snow with thunder":
      return Colors.blueGrey;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}

