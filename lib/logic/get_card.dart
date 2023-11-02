import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sipa/components/card_back_sprite.dart';

import '../pile.dart';
import '../rank.dart';

List<String> cartes = [
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

const emptyCard = SizedBox(
  width: 55,
  height: 75,
);

// ignore: must_be_immutable
class Carte extends StatefulWidget {
  bool canMove;
  Carte(int value, String label, {super.key, this.canMove = false})
      : rank = Rank.fromValueAndLabel(value, label);

  final Rank rank;
  Pile? pile;
  bool _faceUp = false;
  bool _isDragging = false;

  bool get isFaceUp => _faceUp;
  bool get isFaceDown => !_faceUp;
  void flip() => _faceUp = !_faceUp;

  factory Carte.empty() {
    return Carte(0, '', canMove: false);
  }

  @override
  State<Carte> createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  @override
  Widget build(BuildContext context) {
    final Widget render = widget.rank.label.isEmpty
        ? const SizedBox(width: 55, height: 75)
        : GestureDetector(
            child: widget._faceUp ? widget.rank.sprite : cardBackSprite(),
            onTap: () {
              setState(() {
                widget.flip();
              });
            },
          );
    return IgnorePointer(
      ignoring: !widget.canMove,
      child: Draggable(
        data: widget.rank,
        feedback: render,
        childWhenDragging: const SizedBox(
          width: 55,
          height: 75,
        ),
        onDragStarted: () {
          setState(() {
            widget._isDragging = true;
          });
        },
        onDragEnd: (event) {
          if (!widget._isDragging) {
            return;
          }
          setState(() {
            widget._isDragging = false;
          });
        },
        child: render,
      ),
    );
  }
}

int entierAleatoire(min, max) {
  var x = 0;
  x = ((Random().nextDouble() * (max - min + 1)) + min).floor();
  return x;
}

// getUserCards() {
//   userCards.clear();
//   userGiveCards.clear();
//   for (var i = 0; i < 5; i++) {
//     int index = entierAleatoire(0, playCards.length - 1);
//     userCards.add(playCards[index]);
//     playCards.removeAt(index);
//     print(playCards.length);

//     userGiveCards.add(
//       Draggable(
//         data: ["user", userCards[i], i, userCards[i].substring(0, 4)],
//         feedback: Carte(card: userCards[i], open: true),
//         childWhenDragging: const SizedBox(
//           width: 55,
//           height: 75,
//         ),
//         child: Carte(card: userCards[i], open: true),
//       ),
//     );
//     userPlaceHolder.add(
//       Carte(card: userCards[i], open: true),
//     );
//   }
//   print(userCards);
// }

// getComputerCards() {
//   computerCards.clear();
//   computerGiveCards.clear();
//   for (var i = 0; i < 5; i++) {
//     int index = entierAleatoire(0, playCards.length - 1);
//     computerCards.add(playCards[index]);
//     computer.add(playCards[index]);
//     playCards.removeAt(index);
//     print(playCards.length);

//     computerGiveCards.add(
//       Draggable(
//         data: [
//           "computer",
//           computerCards[i],
//           i,
//           computerCards[i].substring(0, 4)
//         ],
//         feedback: Carte(card: computerCards[i], open: false),
//         childWhenDragging: const SizedBox(
//           width: 55,
//           height: 75,
//         ),
//         child: Carte(card: computerCards[i], open: false),
//       ),
//     );
//     computerPlaceHolder.add(
//       Carte(card: computerCards[i], open: false),
//     );
//     showAllComputerCard.add(
//       Carte(card: computerCards[i], open: true),
//     );
//   }
//   print(computerCards);
// }
