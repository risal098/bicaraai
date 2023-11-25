import 'package:flutter/material.dart';
import 'box_achv.dart';

class AchievementCard extends StatefulWidget {
  const AchievementCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  static int points = 1000;
  static int replay = 5;
  static int activeDays = 100;
  static int activeStreak = 60;
  static int allTimeRank = 80;
  static int weeklyRank = 16;
  static int playedSong = 5;
  static int playeDialogue = 10;

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;
    // final double Yay = AchievementCard.height;
    return Container(
      padding: EdgeInsetsDirectional.all(10),
      // height: (height > 850) ?(height * 140 / 800):(height * 140 / 800)+45,
      width: width,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [AchivItems(points, "Total Points"),
        SizedBox(height: 10,),
        BoxAchv(name: "Active Days", value: activeDays.toString(), endText: "days"),
        BoxAchv(name: "Highest Streak", value: activeStreak.toString(), endText: "days"),
        BoxAchv(name: "Average Replay", value: replay.toString(), endText: "times"),
        BoxAchv(name: "Played Songs", value: playedSong.toString(), endText: "audios"),
        BoxAchv(name: "Played Dialogues", value: playeDialogue.toString(), endText: "audios"),
          
        ],
      ),
    );
  }

  SizedBox AchivItems(int data, String name) {
    return SizedBox(
      // width: 300,
      child: Column(
        children: [
          Text(
            data.toString()+" XP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, height: 1),
          )
        ],
      ),
    );
  }
}
