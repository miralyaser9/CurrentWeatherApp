import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class No_weather extends StatelessWidget {
  const No_weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(decoration: const BoxDecoration(gradient:
      LinearGradient(colors: [Colors.black,Colors.lightBlueAccent],begin: Alignment.topCenter,end: Alignment.bottomCenter)
      ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ClipRRect(borderRadius: BorderRadius.circular(200),
            child: const Image(width: 300,image: NetworkImage("https://media.giphy.com/media/snhQpSoCGG3M4XurOb/giphy.gif"),),),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("There Is No Weather😢 Start searching now🔎",style:
              TextStyle(fontSize: 25,fontFamily: "Trash Talk"),),
            )
               // .animate().slideX(begin: 2,end: 3)

          ],
        ),
      ),
    );
  }
}

