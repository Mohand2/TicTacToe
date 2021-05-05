import 'package:flutter/material.dart';

enum Player {
  user,
  computer,
}

class BuildCard extends StatelessWidget {
  final Function play;
  final String img;

  final int id;

  BuildCard({
    this.play,
    this.img,
    this.id,
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => play(id),
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.network(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
