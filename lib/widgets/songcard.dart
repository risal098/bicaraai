import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/song_ans_page.dart';
Widget SongCard(String imageLink, String songName, String singer) {
  return InkWell(
    onTap: () {Get.off(SongAns());},child:
  Card(
    elevation: 5,
    margin: EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(imageLink),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(singer),
              ],
            )
          ],
        ),
        
        Container(
        //  onTap: () {Get.off(SongAns());},
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 40,
          ),
        )
      ]),
    ),
  ));
}
