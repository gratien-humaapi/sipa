import 'dart:math';

import 'package:flutter/material.dart';

List cartes = [
  "ca07.png",
  "ca08.png",
  "ca09.png",
  "ca10.png",
  "ca11.png",
  "ca12.png",
  "ca13.png",
  "co07.png",
  "co08.png",
  "co09.png",
  "co10.png",
  "co11.png",
  "co12.png",
  "co13.png",
  "pi07.png",
  "pi08.png",
  "pi09.png",
  "pi10.png",
  "pi11.png",
  "pi12.png",
  "pi13.png",
  "tr07.png",
  "tr08.png",
  "tr09.png",
  "tr10.png",
  "tr11.png",
  "tr12.png",
  "tr13.png",
];

List playCards = [];

List<String> userCards = [];

List<String> computerCards = [];

List<String> computer = [];

List<Widget> userGiveCards = [];

List<Widget> computerGiveCards = [];

List<Widget> showAllComputerCard = [];

List<Widget> userPlaceHolder = [];

List<Widget> computerPlaceHolder = [];

// ignore: must_be_immutable
class Carte extends StatefulWidget {
  final String card;
  bool open;
  Carte({Key? key, required this.card, required this.open}) : super(key: key);

  @override
  State<Carte> createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        // "images/${widget.card}",
        widget.open == false ? "images/dos-bleu.png" : "images/${widget.card}",
        width: 55,
        height: 75,
        fit: BoxFit.contain,
      ),
      onTap: () {
        setState(() {
          widget.open = true;
        });
      },
    );
  }
}

int entierAleatoire(min, max) {
  var x = 0;
  x = ((Random().nextDouble() * (max - min + 1)) + min).floor();
  return x;
}

getUserCards() {
  userCards.clear();
  userGiveCards.clear();
  for (var i = 0; i < 5; i++) {
    int index = entierAleatoire(0, playCards.length - 1);
    userCards.add(playCards[index]);
    playCards.removeAt(index);
    print(playCards.length);

    userGiveCards.add(
      Draggable(
        data: ["user", userCards[i], i, userCards[i].substring(0, 4)],
        child: Carte(card: userCards[i], open: true),
        feedback: Carte(card: userCards[i], open: true),
        childWhenDragging: const SizedBox(
          width: 55,
          height: 75,
        ),
      ),
    );
    userPlaceHolder.add(
      Carte(card: userCards[i], open: true),
    );
  }
  print(userCards);
}

getComputerCards() {
  computerCards.clear();
  computerGiveCards.clear();
  for (var i = 0; i < 5; i++) {
    int index = entierAleatoire(0, playCards.length - 1);
    computerCards.add(playCards[index]);
    computer.add(playCards[index]);
    playCards.removeAt(index);
    print(playCards.length);

    computerGiveCards.add(
      Draggable(
        data: [
          "computer",
          computerCards[i],
          i,
          computerCards[i].substring(0, 4)
        ],
        child: Carte(card: computerCards[i], open: false),
        feedback: Carte(card: computerCards[i], open: false),
        childWhenDragging: const SizedBox(
          width: 55,
          height: 75,
        ),
      ),
    );
    computerPlaceHolder.add(
      Carte(card: computerCards[i], open: false),
    );
    showAllComputerCard.add(
      Carte(card: computerCards[i], open: true),
    );
  }
  print(computerCards);
}
