import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  const BuildButton({
    this.icon,
    this.color = const Color(0xff28175C),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: Center(child: Icon(icon)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
    );
  }
}
