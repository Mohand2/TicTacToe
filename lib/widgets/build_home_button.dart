import 'package:flutter/material.dart';

class BuildHomeButton extends StatelessWidget {
  final String title;
  final Color leftColor;
  final Color rightColor;

  const BuildHomeButton({
    this.title,
    this.leftColor,
    this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 13,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            //Color(0xff259FEF),
            //Color(0xff2CD67C),
            //Color(0xffA632F1),
            //Color(0xff2C1A6F),
            rightColor,
            leftColor,
          ],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
