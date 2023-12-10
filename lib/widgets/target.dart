import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../controllers/accountData.dart';
class TargetCard extends StatefulWidget {
  const TargetCard({super.key});

  @override
  State<TargetCard> createState() => _TargetCardState();
}

class _TargetCardState extends State<TargetCard> {

  @override
  Widget build(BuildContext context) {
    String target = AccountData.weeklyTarget.toString()+" Audio";
    String spended = AccountData.weeklyProgress.toString()+" Audio";

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      alignment: Alignment.center,
      height: height * 122 / 800,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff20BCDA).withOpacity(0.59)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularPercentIndicator(
            radius: (height >= 800) ?46:40,
            percent: AccountData.weeklyProgresPercentage!/100,
            circularStrokeCap: CircularStrokeCap.round,
            lineWidth: 12,
            progressColor: Color(0xff528DE7),
            animation: true,
            animationDuration: 800,
            animateFromLastPercent: true,
            backgroundColor: Colors.white,
            center: Text("${AccountData.weeklyProgresPercentage}%", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff528DE7)),),
            ),
          TextTarget("Target", target),
          TextTarget("Played Audio", spended),
        ],
      ),
    );
  }

  Column TextTarget(String title, String hours) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          hours,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
