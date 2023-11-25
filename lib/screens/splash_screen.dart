import 'package:flutter/material.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logomark.png", width: 100,),
            SizedBox(height: 10,),
            Text("TOBA APP", style: TextStyle(color: const Color(0xff528DE7), fontSize: 30,
            fontWeight: FontWeight.bold
            ),)
          ],

        ),
      ),
    );
  }
}
