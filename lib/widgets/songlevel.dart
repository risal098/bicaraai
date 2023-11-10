

import 'package:flutter/material.dart';

class Level{
  static String level = "Easy";
}

class StateSongLevel extends StatefulWidget {
  const StateSongLevel({super.key});


  @override
  State<StateSongLevel> createState() => _StateSongLevelState();
}

class _StateSongLevelState extends State<StateSongLevel> {
  bool status1 = true;
  bool status2 = false;
  bool status3 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Row(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              if(status1 != true){
                  Level.level = "Easy";
                  status1 = true;
                  status2 = false;
                  status3 = false;
              }
            });
          },
          child: LevelBox(height, width, status1, "Easy"),
        ),
        
        const SizedBox(width: 5,),
        InkWell(
          onTap: (){
            setState(() {
                if(status2!=true){
                  Level.level = "Medium";
                  status1 = false;
                  status2 = true;
                  status3 = false;
              }
            });
          },
          child: LevelBox(height, width, status2, "Medium"),
        ),
        const SizedBox(width: 5,),
        InkWell(
          onTap: (){
            setState(() {
              if(status3!=true){
                  Level.level = "Hard";
                  status1 = false;
                  status2 = false;
                  status3 = true;
              }
            });
          },
          child: LevelBox(height, width, status3, "Hard"),
        ),
        

      ],
    );
  }

  SizedBox LevelBox(double height, double width, bool status, String name) {
    return SizedBox(
        height: height * 25 / 800,
        width: width * 62 / 360,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: (status == true)?const Color(0xff528DE7):const Color(0xff528DE7).withOpacity(0.7),
              borderRadius: BorderRadius.circular(40)),
          child: Text(
            name,
            style: TextStyle(
              color: (status == true)?Colors.white:Colors.black,
              fontWeight: (status == true)?FontWeight.bold:FontWeight.normal,
            ),
          ),
        ),
      );
  }
  }
