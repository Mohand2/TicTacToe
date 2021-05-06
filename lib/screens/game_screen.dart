import 'package:flutter/material.dart';

import '../widgets/build_button.dart';
import '../widgets/build_player_card.dart';
import '../constants/constants.dart';
import '../widgets/build_card.dart';
import '../logic/variables.dart';
import "dart:math";

enum Result {
  won,
  lost,
  nul,
}

class GameScreen extends StatefulWidget {
  final String playerName;

  const GameScreen({Key key, this.playerName}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool userPlayed;
  bool computerPlayed;
  Result isUserWon;

  @override
  void initState() {
    super.initState();

    image1 = img;
    image2 = img;
    image3 = img;
    image4 = img;
    image5 = img;
    image6 = img;
    image7 = img;
    image8 = img;
    image9 = img;
    isUserWon = Result.nul;
    playerChoosed = 'waiting...';
    computerChoosed = 'waiting...';
    places = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    playerChoosedPlaces = [];
    computerChoosedPlaces = [];
    column1 = {1, 4, 7};
    column2 = {2, 5, 8};
    column3 = {3, 6, 9};
    row1 = {1, 2, 3};
    row2 = {4, 5, 6};
    row3 = {7, 8, 9};
    diagonal1 = {3, 5, 7};
    diagonal2 = {1, 5, 9};
    gameOver = false;
    winner = 'Match Nul';
    userPlayed = true;
    computerPlayed = false;
  }

  // game reinitialisation
  gameInit() {
    setState(() {
      image1 = img;
      image2 = img;
      image3 = img;
      image4 = img;
      image5 = img;
      image6 = img;
      image7 = img;
      image8 = img;
      image9 = img;
      isUserWon = Result.nul;
      places = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      playerChoosedPlaces = [];
      computerChoosedPlaces = [];
      playerChoosed = 'waiting...';
      computerChoosed = 'waiting...';
      column1 = {1, 4, 7};
      column2 = {2, 5, 8};
      column3 = {3, 6, 9};
      row1 = {1, 2, 3};
      row2 = {4, 5, 6};
      row3 = {7, 8, 9};
      diagonal1 = {3, 5, 7};
      diagonal2 = {1, 5, 9};
      gameOver = false;
      winner = 'Match Nul';
      userPlayed = true;
      computerPlayed = false;
    });
    print('Game restarted !');
  }

// is won function to check the winner
  bool isWon(Set list) {
    if ((list.intersection(column1)).length == 3) {
      return true;
    }
    if ((list.intersection(column2)).length == 3) {
      return true;
    }
    if ((list.intersection(column3)).length == 3) {
      return true;
    }
    if ((list.intersection(row1)).length == 3) {
      return true;
    }
    if ((list.intersection(row2)).length == 3) {
      return true;
    }
    if ((list.intersection(row3)).length == 3) {
      return true;
    }
    if ((list.intersection(diagonal1)).length == 3) {
      return true;
    }
    if ((list.intersection(diagonal2)).length == 3) {
      return true;
    }

    return false;
  }

  userPlay(int id) async {
    setState(() {
      computerPlayed = true;
      userPlayed = false;
    });
    // chek if the id is in places
    if (places.contains(id)) {
      setState(() {
        playerChoosed = '$id';
      });
      print('player choosed : $id');
      // set xImage according to the id
      switch (id) {
        case 1:
          setState(() {
            image1 = xImage;
          });
          break;
        case 2:
          setState(() {
            image2 = xImage;
          });
          break;
        case 3:
          setState(() {
            image3 = xImage;
          });
          break;
        case 4:
          setState(() {
            image4 = xImage;
          });
          break;
        case 5:
          setState(() {
            image5 = xImage;
          });
          break;
        case 6:
          setState(() {
            image6 = xImage;
          });
          break;
        case 7:
          setState(() {
            image7 = xImage;
          });
          break;
        case 8:
          setState(() {
            image8 = xImage;
          });
          break;
        case 9:
          setState(() {
            image9 = xImage;
          });
          break;

          break;
        default:
      }

      // print(id);
      setState(() {
        playerChoosedPlaces.add(id);
        places.remove(id);
        print('Player Choosed places: $playerChoosedPlaces');
        print(places);
      });
      // check if the list of th evailable places is empty if so then the Game over
      if (places.isEmpty) {
        setState(() {
          gameOver = true;
        });
        print('game finiched');
      }
      // Checks if the choosen places are > 2
      if (playerChoosedPlaces.length > 2) {
        //check if the player won according to the set of chossen places
        if (isWon(playerChoosedPlaces.toSet())) {
          setState(() {
            gameOver = true;
            winner = 'player';
            isUserWon = Result.won;
          });

          print('player wins');
        }
      }

      // make a delay befor the computer plays
      await Future.delayed(const Duration(seconds: 1));

      // if places are available and the is no over the it computer turns
      if (places.isNotEmpty && !gameOver) computerPlay();
    }
  }

  // Computer turn to play

  computerPlay() async {
    setState(() {
      userPlayed = true;
      computerPlayed = false;
    });
    // picking a random id from the resting places

    final _random = new Random();
    var id = places[_random.nextInt(places.length)];
    if (places.contains(id)) {
      setState(() {
        // then add the chossen place to a set of computter choosed places
        computerChoosedPlaces.add(id);

        // removing the chossen place from the available places
        places.remove(id);

        print('Computer choosed places: $computerChoosedPlaces');
      });
    }
    print(places);

    print('computer choosed place : $id');
    setState(() {
      // set computer choosed variable to display the id on screen
      computerChoosed = '$id';
    });
    // seting oImage  according to the id
    switch (id) {
      case 1:
        setState(() {
          image1 = oImage;
        });
        break;
      case 2:
        setState(() {
          image2 = oImage;
        });
        break;
      case 3:
        setState(() {
          image3 = oImage;
        });
        break;
      case 4:
        setState(() {
          image4 = oImage;
        });
        break;
      case 5:
        setState(() {
          image5 = oImage;
        });
        break;
      case 6:
        setState(() {
          image6 = oImage;
        });
        break;
      case 7:
        setState(() {
          image7 = oImage;
        });
        break;
      case 8:
        setState(() {
          image8 = oImage;
        });
        break;
      case 9:
        setState(() {
          image9 = oImage;
        });
        break;

        break;
      default:
    }

    // Checks if the choosen places are > 2
    if (computerChoosedPlaces.length > 2) {
      //check if the computer won according to the set of chossen places
      if (isWon(computerChoosedPlaces.toSet())) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          // Game over if computer won
          gameOver = true;
          winner = 'computer';
          isUserWon = Result.lost;
        });
        print('computer wins');
      }
    }
    // Condition Ends
  }

  // Computer turn to play ends here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff28175C),
              image: DecorationImage(
                image: AssetImage(gameBackImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          !gameOver
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: BuildButton(icon: Icons.arrow_back),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: BuildButton(icon: Icons.speaker_rounded),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BuildPlayerCard(
                            playImg: xImage,
                            context: context,
                            playerName: widget.playerName,
                            avatar: playerAvatar,
                            isPlaying: userPlayed),
                        BuildPlayerCard(
                            playImg: oImage,
                            context: context,
                            avatar: botAvatar,
                            isPlaying: computerPlayed),
                      ],
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Player Choosed : $playerChoosed',
                    //       style: TextStyle(fontSize: 25.0),
                    //     ),
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     Text(
                    //       'Computer Choosed : $computerChoosed',
                    //       style: TextStyle(fontSize: 25.0),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildCard(
                              img: image1,
                              id: 1,
                              play: userPlay,
                            ),
                            BuildCard(
                              img: image2,
                              id: 2,
                              play: userPlay,
                            ),
                            BuildCard(
                              img: image3,
                              id: 3,
                              play: userPlay,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildCard(
                              img: image4,
                              id: 4,
                              play: userPlay,
                            ),
                            BuildCard(
                              img: image5,
                              id: 5,
                              play: userPlay,
                            ),
                            BuildCard(
                              img: image6,
                              id: 6,
                              play: userPlay,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildCard(
                              img: image7,
                              id: 7,
                              play: userPlay,
                            ),
                            BuildCard(
                              img: image8,
                              id: 8,
                              play: userPlay,
                            ),
                            BuildCard(
                              img: image9,
                              id: 9,
                              play: userPlay,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextButton(
                          onPressed: gameInit,
                          child: Text(
                            'Replay',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          backgroundImage: (() {
                            if (isUserWon == Result.won) {
                              return AssetImage(wonImage);
                            } else if (isUserWon == Result.lost) {
                              return AssetImage(loseImage);
                            }
                            return AssetImage(drawImage);
                          }()),
                          maxRadius: MediaQuery.of(context).size.height / 7,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: (() {
                          if (isUserWon == Result.won) {
                            return resultText(
                                context: context, text: 'You won');
                          } else if (isUserWon == Result.lost) {
                            return resultText(
                                context: context, text: 'You lost');
                          }
                          return resultText(context: context, text: 'Nul');
                        }()),
                      ),
                      GestureDetector(
                        onTap: () => gameInit(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: BuildButton(
                            color: Color(0xffD4af37),
                            icon: Icons.replay,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      )),
    );
  }

  Text resultText({BuildContext context, @required String text}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: MediaQuery.of(context).size.width / 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
