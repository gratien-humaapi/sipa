import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sipa/components/card_back_sprite.dart';

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
class Carte extends HookWidget {
  final bool canMove;
  final Rank rank;
  bool faceUp;
  AnimationController? animationController;

  Carte(int value, String label,
      {Key? key,
      this.canMove = false,
      this.faceUp = true,
      this.animationController})
      : rank = value == 0 ? Rank.empty() : Rank.fromValueAndLabel(value, label),
        super(key: key);

  factory Carte.empty() {
    return Carte(0, '', canMove: false);
  }

  // void move() {
  //   animationController.forward();
  // }

  @override
  Widget build(BuildContext context) {
    final isFaceUp = useState<bool>(faceUp);
    final isDragging = useState<bool>(false);

    void flip() => isFaceUp.value = !isFaceUp.value;

    animationController ??=
        useAnimationController(duration: const Duration(milliseconds: 200));
    // Utilisez le AnimationController passé en tant que paramètre
    final animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 2.0),
    ).animate(animationController!);

    final Widget render = rank.value == 0
        ? const SizedBox(width: 55, height: 75)
        : GestureDetector(
            child: isFaceUp.value ? rank.sprite : cardBackSprite(),
            onTap: () {
              // flip();
              animationController!.forward();
            },
          );

    return SlideTransition(
      position: animation,
      child: IgnorePointer(
        ignoring: !canMove,
        child: Draggable(
          data: rank,
          feedback: render,
          childWhenDragging: const SizedBox(
            width: 55,
            height: 75,
          ),
          onDragStarted: () {
            isDragging.value = true;
          },
          onDragEnd: (details) {
            if (!isDragging.value) return;
            isDragging.value = false;
          },
          child: render,
        ),
      ),
    );
  }
}

// class Carte extends StatefulWidget {
//   bool canMove;
//   Carte(int value, String label, {super.key, this.canMove = false})
//       : rank = value == 0 ? Rank.empty() : Rank.fromValueAndLabel(value, label);

//   final Rank rank;
//   bool _faceUp = false;
//   bool _isDragging = false;

//   bool get isFaceUp => _faceUp;
//   bool get isFaceDown => !_faceUp;
//   void flip() => _faceUp = !_faceUp;

//   factory Carte.empty() {
//     return Carte(0, '', canMove: false);
//   }

//   @override
//   State<Carte> createState() => _CarteState();
// }

// class _CarteState extends State<Carte> {
//   @override
//   Widget build(BuildContext context) {
//     final Widget render = widget.rank.value == 0
//         ? const SizedBox(width: 55, height: 75)
//         : GestureDetector(
//             child: widget._faceUp ? widget.rank.sprite : cardBackSprite(),
//             onTap: () {
//               setState(() {
//                 widget.flip();
//               });
//             },
//           );
//     return IgnorePointer(
//       ignoring: !widget.canMove,
//       child: Draggable(
//         data: widget.rank,
//         feedback: render,
//         childWhenDragging: const SizedBox(
//           width: 55,
//           height: 75,
//         ),
//         onDragStarted: () {
//           setState(() {
//             widget._isDragging = true;
//           });
//         },
//         onDragEnd: (event) {
//           if (!widget._isDragging) {
//             return;
//           }
//           setState(() {
//             widget._isDragging = false;
//           });
//         },
//         child: render,
//       ),
//     );
//   }
// }

int entierAleatoire(min, max) {
  var x = 0;
  x = ((Random().nextDouble() * (max - min + 1)) + min).floor();
  return x;
}

class MyPage extends HookWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation de useAnimationController pour créer et gérer l'AnimationController.
    final AnimationController _controller = useAnimationController(
      duration: Duration(seconds: 1),
    );

    // Démarrez l'animation lorsque le widget est construit.
    useEffect(() {
      _controller.forward();
      return _controller
          .dispose; // Dispose the controller when the widget is unmounted
    }, const []); // Les crochets vides indiquent que l'effet ne dépend d'aucune variable et ne doit s'exécuter qu'une fois.

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset:
                Offset(0, 100 * _controller.value), // Animation effectuée ici.
            child: FlutterLogo(size: 100),
          );
        },
      ),
    );
  }
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
