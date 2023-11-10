import 'package:flutter/material.dart';

  Card FavCard(String imageLink, String song, String singer) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(50), // Image radius
              child: Image.network(
                  imageLink,
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            song,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(singer),
        ],
      ),
    );
  }