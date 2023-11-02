import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sipa/logic/get_card.dart';
import 'package:sipa/logic/score.dart';
import 'package:sipa/screen/get_pseudo.dart';

int player = 1;
List scores = [];

String playerName = 'Player';
String dernier = "";
String whoTakeIt = '';

bool checkmax(String un, String deux) {
  print({un, deux});
  var user = int.parse(un.substring(2, 4));
  var co = int.parse(deux.substring(2, 4));
  print({user, co});
  if (user > co) {
    return true;
  } else {
    return false;
  }
}

bool faceUpCard(String userCard, String coCard) {
  var user = userCard.substring(0, 2);
  var co = coCard.substring(0, 2);
  print(user);
  print(co);
  if (user == co) {
    print(true);
    return true;
  } else {
    print(false);
    return false;
  }
}

Future askExitGame(BuildContext context, score) async => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: const Text('Do you want to leave the game?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                addScore(playerName, score);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              storage: ScoreStorage(),
                            )),
                    (route) => false);
              },
              child: const Text('Yes'),
            ),
          ],
        ));

Future<File> addScore(name, score) {
  allScores = allScores + '$playerName $score\n';
  scores.add('$playerName $score');

  // Write the variable as a string to the file.
  return ScoreStorage().writeCounter(allScores);
}

Future askExit(BuildContext context) async => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: const Text('Do you want to exit?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Yes'),
            ),
          ],
        ));

showWinner(BuildContext context, winner) => showDialog(
    context: context,
    builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Center(
            child: Stack(children: [
              Image.asset(
                'assets/win.gif',
                height: double.infinity,
                width: double.infinity,
              ),
              Center(
                child: SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          winner == 'user' ? '$playerName win' : "Computer win",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'Cardanaya',
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 130.0,
                          height: 45,
                          // ignore: deprecated_member_use
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF225577),
                              shape: RoundedRectangleBorder(
                                  // side:
                                  //     BorderSide(width: 2.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {
                              // clean();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Replay",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));

showRestart(BuildContext context, whoTakeIt) => showDialog(
    context: context,
    builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    whoTakeIt == 'user'
                        ? "$playerName only has cards of same color. Press Restart"
                        : "Computer only has cards of same color. Press Restart",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 130.0,
                    height: 45,
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            // side:
                            //     BorderSide(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {
                        playCards.clear();
                        playCards.addAll(cartes);
                        // clean();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Restart",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));

checkAllColor() {
  int toutCouleurUser = 0;
  int toutCouleurComputer = 0;
  for (var element in userCards) {
    if ((element.substring(0, 2) == 'ca' || element.substring(0, 2) == 'co')) {
      toutCouleurUser = toutCouleurUser + 1;
    }
  }
  if (toutCouleurUser != 5) {
    toutCouleurUser = 0;
    for (var element in userCards) {
      if ((element.substring(0, 2) == 'pi' ||
          element.substring(0, 2) == 'tr')) {
        toutCouleurUser = toutCouleurUser + 1;
      }
    }
  }

  for (var element in computerCards) {
    if (element.substring(0, 2) == 'ca' || element.substring(0, 2) == 'co') {
      toutCouleurComputer = toutCouleurComputer + 1;
    }
  }
  if (toutCouleurComputer != 5) {
    toutCouleurComputer = 0;
    for (var element in computerCards) {
      if (element.substring(0, 2) == 'pi' || element.substring(0, 2) == 'tr') {
        toutCouleurComputer = toutCouleurComputer + 1;
      }
    }
  }

  if (toutCouleurUser == 5 || toutCouleurComputer == 5) {
    if (toutCouleurUser == 5) {
      whoTakeIt = 'Player';
    }
    if (toutCouleurComputer == 5) {
      whoTakeIt = 'Computer';
    }
    return true;
  } else {
    return false;
  }
}
