import 'package:flutter/material.dart';

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
      height: (height > 850) ?(height * 140 / 800):(height * 140 / 800)+45,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AchivItems(activeDays, "Active Days"),
              AchivItems(activeStreak, "Highest Active Days Streak"),
              AchivItems(allTimeRank, "Highest All-Time Rank"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AchivItems(weeklyRank, "Highest Weekly Rank"),
              AchivItems(playedSong, "Played Song"),
              AchivItems(playeDialogue, "Played Dialogue"),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  SizedBox AchivItems(int data, String name) {
    return SizedBox(
      width: 95,
      child: Column(
        children: [
          Text(
            data.toString(),
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
