import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './progress.dart';
import 'package:bicaraai/widgets/searchbar.dart';
import 'package:bicaraai/widgets/favcard.dart';
import 'package:bicaraai/widgets/songcard.dart';
import 'package:bicaraai/widgets/songlevel.dart';
import 'package:get/get.dart';

class SongSection extends StatelessWidget {
  const SongSection({super.key});
  static var level = Level.level;

  @override
  Widget build(BuildContext context) {
    var imageList = [
      "https://i.scdn.co/image/ab67616d0000b2730c76be87f513c8361d06d6bd",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
      "https://upload.wikimedia.org/wikipedia/en/7/75/What_Makes_You_Beautiful_Album_Cover.jpg",
      "https://upload.wikimedia.org/wikipedia/en/8/87/Michael_Jackson_-_Heal_the_World.png",
      "https://i1.sndcdn.com/artworks-GSvPigmkmpKHRi8C-Sv4aJw-t500x500.jpg",
      "https://i1.sndcdn.com/artworks-hADAxnACXWoAx6Og-YihIxg-t500x500.jpg"
    ];
    var songList = ["A Thousand Years", "Love Yourself", "What Makes You Beautiful", "Heal the World", "Easy On Me", "We Don't Talk Anymore"];
    var singerist = ["Christina Perri", "Justin Bieber", "One Direction", "Michael Jackson", "Adele", "Charlie Puth"];

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SizedBox(
        height: (height >= 840) ? height - (height * (56 / 800)) : height + 40,
        child: SingleChildScrollView(
          child: Container(
              width: width,
              height: (height >= 840)
                  ? height - (height * (56 / 800))
                  : height + 40,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Color(0xff15CAD7),
                    Color(0xffE8E8E8),
                    Color(0xffE8E8E8)
                  ])),
              child: Padding(
                  padding: (height >= 840)
                      ? EdgeInsets.only(
                          top: 0.04 * height,
                          left: 0.05 * width,
                          right: 0.05 * width)
                      : EdgeInsets.only(
                          top: 0.03 * height,
                          left: 0.072 * width,
                          right: 0.072 * width),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Song Section",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: (height >= 840) ? 10 : 0,
                      ),
                      const SearchingBar(),
                      SizedBox(
                        height: (height >= 840) ? 10 : 0,
                      ),
                      // Fav
                      const Text(
                        "Favorites",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 150,
                        width: width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FavCard(
                                  'https://i1.sndcdn.com/artworks-000393932631-f2l978-t500x500.jpg',
                                  "Love Mysfelf",
                                  "BTS"),
                              FavCard(
                                  'https://i1.sndcdn.com/artworks-000393932631-f2l978-t500x500.jpg',
                                  "Love Mysfelf",
                                  "BTS"),
                              FavCard(
                                  'https://i1.sndcdn.com/artworks-000393932631-f2l978-t500x500.jpg',
                                  "Love Mysfelf",
                                  "BTS"),
                              FavCard(
                                  'https://i1.sndcdn.com/artworks-000393932631-f2l978-t500x500.jpg',
                                  "Love Mysfelf",
                                  "BTS"),
                            ],
                          ),
                        ),
                      ),

                      // Play Random Song
                      Container(
                        height: height * (71 / 800),
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  const Color(0xff528DE7).withOpacity(0.95),
                                  const Color(0xff20BCDA).withOpacity(0.95),
                                  const Color(0xff1CC2D9).withOpacity(0.95),
                                  const Color(0xff0FD3D5),
                                  const Color(0xff0FD3D5)
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // SizedBox(width: width*0.005,),
                              const Text(
                                "Play Random Song",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),

                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * (34 / 800),
                                  width: 92,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff528DE7)
                                          .withOpacity(0.95),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "Play",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Song List",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.sort_rounded,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Sort",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "See More",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      const StateSongLevel(),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: (height >= 840) ? (height / 2.5) : (height / 3),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            for (int i = 0; i < songList.length; i++)
                              SongCard(imageList[i], songList[i], singerist[i]),
                            // SongCard(
                            //     "",
                            //     "",
                            //     ""),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // SongCard(
                            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
                            //     "Love Yourself",
                            //     ""),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // SongCard(
                            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
                            //     "Love Yourself",
                            //     "Justin Bieber"),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // SongCard(
                            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
                            //     "Love Yourself",
                            //     "Justin Bieber"),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // SongCard(
                            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
                            //     "Love Yourself",
                            //     "Justin Bieber"),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // SongCard(
                            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
                            //     "Love Yourself",
                            //     "Justin Bieber"),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // SongCard(
                            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM_Sy-0v7dsyYtzlTOX3XpAXqW1kOxxx5Pup3_gi0osq8mfw1f",
                            //     "Love Yourself",
                            //     "Justin Bieber"),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                          ],
                        )),
                      )
                    ],
                  ))),
        ),
      ),
      bottomNavigationBar: Container(
        width: width,
        height: height * (56 / 800),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, -4),
              blurRadius: 4),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/home.svg",
              width: 44,
              height: 44,
            ),
            SizedBox(width: 0.2 * width),
            InkWell(
              onTap: () {
                Get.to(const ProgressPage());
              },
              child: SvgPicture.asset(
                "assets/icons/trophy.svg",
                width: 41,
                height: 41,
              ),
            ),
            SizedBox(width: 0.2 * width),
            SvgPicture.asset("assets/icons/ui-user-profile.svg"),
          ],
        ),
      ),
    );
  }
}
