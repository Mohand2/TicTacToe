import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:got_app/screens/game_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  String playerName = 'player';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/homeScreen.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 6,
              top: MediaQuery.of(context).size.height / 1.6,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    // height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (text) {
                        setState(() {
                          playerName = text;
                        });
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: 'Your Name',
                        // hintText: "Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameScreen(
                                  playerName: playerName,
                                )),
                      );
                    },
                    child: Container(
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
                            Color(0xffF89545),
                            Color(0xffF85D8A),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
