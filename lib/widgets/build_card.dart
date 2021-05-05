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
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(30),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
