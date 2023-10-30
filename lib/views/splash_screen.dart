import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/views/homepage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        backgroundColor: Color(0xffE2E2FA),elevation: 0
        ,systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xffE2E2FA)),)
      ,body:
    AnimatedSplashScreen(
        backgroundColor: Colors.white,
        animationDuration: Duration(seconds: 11),
        splashTransition: SplashTransition.slideTransition,splashIconSize: 200
        ,splash: Center(
          child: Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text("welcome",style: TextStyle(fontSize: 50,

              fontWeight: FontWeight.bold,fontFamily: "Trash Talk",color: Colors.blue),
      ), ClipRRect(
            borderRadius: BorderRadius.circular(200)
            ,child:Image(width: 100,height: 120,image:
        NetworkImage("https://media.giphy.com/media/xT9DPKLOa0J849owzS/giphy.gif"),),
        ),

    ],),
          ),
        ), nextScreen: HomePage()
    ),
    );
  }
}
