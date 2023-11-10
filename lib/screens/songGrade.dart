import 'package:bicaraai/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import "./accountPage.dart";
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';


class SongGrade extends StatefulWidget{
  SongGrade({super.key});

  @override
  _SongGrade createState() => _SongGrade();
}

class _SongGrade extends State<SongGrade>{
MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);
int option=0;

Widget wrapper(int options){
//  print("tes");
if(options==0){
  return InkWell(
    onTap: (){setState((){this.option=1;});},
    child:Container(
    
    width: 197,padding: EdgeInsets.all(3),
    height: 36,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.blue,
      
    ),
    child: Row(children: [
      Container(
        padding: EdgeInsets.all(8),
        width: 90,
        child: AutoSizeText("My Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.blue)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
        ),
      ),
      Container(
        padding: EdgeInsets.all(5),
        width:98,
        child: AutoSizeText("Right Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.white),)
      )
    ],
    ),
  ));
}
else{
  return InkWell(
    onTap: (){setState((){this.option=0;});}
    ,child: Container(
    
    width: 197,padding: EdgeInsets.all(3),
    height: 36,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.blue,
      
    ),
    child: Row(children: [
      Container(
        padding: EdgeInsets.all(8),
        width: 90,
        child: AutoSizeText("My Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.white))
      ),
      Container(
        padding: EdgeInsets.all(5),
        width:98,
        child: AutoSizeText("Right Answers",style: TextStyle(fontSize: 3,fontFamily: "Poppins",color: Colors.blue),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
        ),
      )
    ],
    ),
  ));
}
}
void tes(){
  Get.offAll(HomePage());
}

double progres=0.75;
String result="Great Job!";

@override
Widget build(BuildContext context){
  print("rebuild");
  return  SafeArea(
      child: Scaffold(
        body:Row(
          children: [
             Container(
              width: mediaQueryData.size.width/11,
              color: Colors.white,
             )
             ,Expanded(child:Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: SingleChildScrollView(child: 
              Column(children:  //makanan utama
              [
                SizedBox(
              
              height: 30,
             ),
             SizedBox(
              height: 20,
             )
    ,Container(
          width: mediaQueryData.size.width*9/11,
          decoration: BoxDecoration(
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              height: 20,
             ),
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 8.0,
                percent: progres, // Adjust the percentage as needed
                center:
                 Text("${progres*100}%",style: TextStyle(fontSize: 40,fontFamily: 
                "Poppins",fontWeight: FontWeight.w600,color: Color(0xFF527EE7)),),

                progressColor: Color(0xFF527EE7),
              ),SizedBox(
              
              height: 10,
             ),AutoSizeText(
            textAlign:TextAlign.left,
              "${result}",
              style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 35),
              maxLines: 2,
            ),
              SizedBox(
              
              height: 10,
             ),Container(
              width: mediaQueryData.size.width*9/11,
              alignment: Alignment.centerLeft,
              child:wrapper(this.option)),
              
              SizedBox(
              height: 24,
              
             ),Container( //tempat jawaban user
              padding: EdgeInsets.all(8),
  width: mediaQueryData.size.width*9/11, // Set your desired width
  height: 200, // Set your desired height
  decoration: BoxDecoration(
    border: Border.all(color: Colors.blue),
    borderRadius: BorderRadius.circular(15),
  ),
  child: Column(
    children: [
      Expanded(
        child: chooseAnswer()
      ),
    ],
  ),
)
            ],
          ),
        ),
              
              SizedBox(
              
              height: 10,
             ),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF527EE7),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    minimumSize: Size(mediaQueryData.size.width*9/11 , 46), // Set the width and height as needed
  ),
                onPressed: tes,
                child: Text("Finish Review",style: TextStyle(color: Colors.white),),
              )]/*utama*/
              ,)
              ),
             ))
             ,Container(
              width: mediaQueryData.size.width/11,
              color: Colors.white,
             )
          ],
        )
      )
      );
}


Widget userAnswer(){
  return ListView(
          children: [
            Text("lorem ipsumf fejndkawdjkhawkdkawhdawdoiawjdo d kefefjoef fejndkawdjkhawkdkawhdawdoiawjdo diowajdoiawjdjawdijawo djawodjoiajdawjfoejf lorem ipsumf kefefjoef fejndkawdjkhawkdkawhdawdoiawjdo diowajdoiawjdjawdijawo djawodjoiajdawjfoejf"),
            AutoSizeText("halo lorem ipsumf kefefjoef fejndkawdjkhawkdkawhdawdoiawjdo diowajdoiawjdjawdijawo djawodjoiajdawjfoejf lorem ipsumf kefefjoef fejndkawdjkhawkdkawhdawdoiawjdo diowajdoiawjdjawdijawo djawodjoiajdawjfoejf"
            ,maxLines:6),// Add your content here, such as other containers and images
            Container(
              // Your content container 1
            ),
            Container(
              // Your content container 2
            ),
            
            // Add more content as needed
          ],
        );
}
Widget rightAnswer(){
  return ListView(
          children: [
            Text("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll"),
            AutoSizeText("halo lorem ipsumf kefefjoef fejndkawdjkhawkdkawhdawdoiawjdo diowajdoiawjdjawdijawo djawodjoiajdawjfoejf lorem ipsumf kefefjoef fejndkawdjkhawkdkawhdawdoiawjdo diowajdoiawjdjawdijawo djawodjoiajdawjfoejf"
            ,maxLines:6),// Add your content here, such as other containers and images
            Container(
              // Your content container 1
            ),
            Container(
              // Your content container 2
            ),
            
            // Add more content as needed
          ],
        );
}
Widget chooseAnswer(){
  if(this.option==0){return userAnswer() ; }
  else{return rightAnswer(); }
 
}
}