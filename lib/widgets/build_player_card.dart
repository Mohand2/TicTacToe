import 'package:flutter/material.dart';

class BuildPlayerCard extends StatelessWidget {
  final String playerName;
  final String avatar;
  final String playImg;
  final isPlaying;
  final BuildContext context;

  const BuildPlayerCard({
    @required this.context,
    this.playerName = 'EasyBot',
    this.avatar,
    this.isPlaying,
    this.playImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 60),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        border: isPlaying
            ? Border.all(
                width: 3,
                color: Color(0xff892cd7),
              )
            : null,
        borderRadius: BorderRadius.circular(20),
        color: isPlaying ? Color(0xff16213e) : Color(0xff28175C),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isPlaying
              ? Icon(
                  Icons.arrow_downward,
                  color: Colors.cyan,
                )
              : Container(),
          CircleAvatar(
            backgroundColor: isPlaying ? Colors.transparent : Color(0xff16213e),
            backgroundImage: AssetImage(avatar),
            maxRadius: isPlaying ? 50 : 30,
            minRadius: 30,
          ),
          Text(
            playerName.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isPlaying ? Color(0xffD4af37) : Colors.grey[400],
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(playImg),
          ),
        ],
      ),
    );
  }
}
