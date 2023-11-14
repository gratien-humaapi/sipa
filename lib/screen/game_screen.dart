import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sipa/logic/get_card.dart';
import 'package:sipa/logic/playing_logic.dart';
import 'package:sipa/logic/score.dart';
import 'package:sipa/models/computer.dart';
import 'package:sipa/models/player.dart';
import 'package:sipa/rank.dart';
import 'package:sipa/screen/get_pseudo.dart';

void distributionOfCards(
    {required Player player,
    required Computer computer,
    required TickerProvider vsync}) {
// Creation des cartes
  final cards = [
    for (var rank = 7; rank <= 13; rank++)
      for (var suit in ['s', 'h', 'c', 'd']) Rank.fromValueAndLabel(rank, suit),
  ];
// Melange des cartes
  cards.shuffle();

// Distribution des cartes player
  for (var i = 0; i < 5; i++) {
    player.acquireCard(cards.removeLast());
  }
// Distribution des cartes computer
  for (var i = 0; i < 5; i++) {
    computer.acquireComputerCard(
        ComputerCard(rank: cards.removeLast(), vsync: vsync));
  }
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin {
  int scorePlayer = 0;
  int scoreComputer = 0;
  List<Carte> userPlayCards = [];
  List<Carte> computerPlayCards = [];
  List<String> userPlay = [];
  List<String> computerPlay = [];
  bool sameColorCard = false;

  Rank? askedCard;

  String currentPlayer = '2';

  Computer computer = Computer(name: "Computer", id: '1');
  Player player = Player(name: 'John', id: '2');

  void nextPlayer() {
    if (currentPlayer == player.id) {
      currentPlayer = computer.id;
    } else {
      currentPlayer = player.id;
    }
    setState(() {
      //
    });
    // final int activePlayerIndex =
    //     players.indexWhere((player) => player.id == currentPlayer);
    // final int nextPlayerIndex =
    //     activePlayerIndex == players.length - 1 ? 0 : activePlayerIndex + 1;
    // setState(() {
    //   currentPlayer = players[nextPlayerIndex].id;
    // });
    print('can play : $currentPlayer');
  }

  // void clean() {
  //   computerPlay.clear();
  //   computerPlayCards.clear();
  //   computerCards.clear();
  //   computer.clear();
  //   computerGiveCards.clear();
  //   computerPlaceHolder.clear();
  //   userPlay.clear();
  //   userPlayCards.clear();
  //   userCards.clear();
  //   userGiveCards.clear();
  //   userPlaceHolder.clear();
  //   showAllComputerCard.clear();
  //   playCards.clear();
  //   playCards.addAll(cartes);
  //   getUserCards();
  //   getComputerCards();
  //   sameColorCard = checkAllColor();
  //   player = 1;
  //   dernier = "";
  //   setState(() {});
  // }

  @override
  void initState() {
    // playCards.clear();
    // playCards.addAll(cartes);
    // getUserCards();
    // getComputerCards();
    // sameColorCard = checkAllColor();
    distributionOfCards(player: player, computer: computer, vsync: this);
    // clean();
    super.initState();
  }

  void cPlay(Rank? currentCard) {
    late ComputerCard answerCard;
    final List<ComputerCard> computerHand = computer.cards;

    if (currentCard == null) {
      computerHand[entierAleatoire(0, computerHand.length - 1)]
          .animationController
          .forward();
      // computerPlayCards.add(Carte(answerCard.value, answerCard.label));
      // computer.removeCard(answerCard);
      // askedCard = answerCard;
      nextPlayer();
      return;
    }

    //

    List<Rank> sameCards = [];
    List<int> sameCardIndexes = [];
    for (int i = 0; i < computerHand.length; i++) {
      if (computerHand[i].label == currentCard.label) {
        // sameCards.add(item);
        sameCardIndexes.add(i);
      }
      print(sameCards.length);
    }

    if (sameCards.isEmpty) {
      // answerCard = computerHand[entierAleatoire(0, computerHand.length - 1)];
      computer.cards[entierAleatoire(0, computerHand.length - 1)];
    } else {
      sameCards.shuffle();
      answerCard = sameCards.first;
    }

    computerPlayCards.add(Carte(answerCard.value, answerCard.label));
    computer.removeCard(answerCard);
    askedCard = null;
    if (currentCard.value > answerCard.value) {
      nextPlayer();
    }

    // if (computerPlayCards.length == userPlayCards.length) {
    //   bool check;
    //   bool show = currentCard.label == computerPlayCards.last.rank.label;
    //   if (show) {
    //     check = computerPlayCards.last.rank.value > currentCard.value;
    //     computerPlayCards
    //         .add(Carte(computerCards[i].value, computerCards[i].label));
    //     if (!check) {
    //       nextPlayer();
    //     }
    //   } else {
    //     computerPlayCards
    //         .add(Carte(computerCards[i].value, computerCards[i].label));
    //     nextPlayer();
    //   }

    //   // show
    //   //     ? {
    //   //         check = checkmax(userPlay[userPlay.length - 1],
    //   //             computerPlay[computerPlay.length - 1]),
    //   //         check
    //   //             ? {computerPlayCards.add(computerCards[i]), player = 1}
    //   //             : {computerPlayCards.add(computerCards[i]), player = 2}
    //   //       }
    //   //     : {
    //   //         computerPlayCards.add(
    //   //           Carte(card: computerPlay.last, open: false),
    //   //         ),
    //   //         player = 1,
    //   //       };
    // }

    // else {
    //   computerPlayCards.add(
    //     computerPlay.last
    //   );
    //   player = 1;
    // }

    // if (computerPlay.length == 5 && userPlay.length == 5) {
    //   bool same = faceUpCard(userPlay.last, computerPlay.last);
    //   bool max;
    //   same
    //       ? {
    //           max = checkmax(userPlay.last, computerPlay.last),
    //           max
    //               ? setState(() {
    //                   dernier = 'user';
    //                 })
    //               : setState(() {
    //                   dernier = 'computer';
    //                 }),
    //         }
    //       : setState(() {
    //           dernier = 'user';
    //         });
    //   player = 0;
    //   if (dernier == 'user') {
    //     scorePlayer = scorePlayer + 1;
    //   } else {
    //     scoreComputer = scoreComputer + 1;
    //   }
    //   setState(() {});
    //   Future.delayed(const Duration(milliseconds: 500))
    //       .then((value) => showWinner(context, dernier, clean));
    // }
  }

  void compPlay() {
    int i = 0;
    // do {
    //   cPlay(askedCard);
    //   print('i = ${++i}');
    // } while (currentPlayer == players[0].id);
    // while (currentPlayer == players[0].id) {
    cPlay(askedCard);
    print('i = ${++i}');
    // setState(() {
    //  // Update all variables
    // });
    // }
  }

  // void uPlay(List data) {
  //   setState(() {
  //     userPlay.add(data[3]);
  //     print(userCards);
  //     userGiveCards[data[2]] = const SizedBox(
  //       width: 55,
  //       height: 75,
  //     );
  //   });
  //   userPlaceHolder[data[2]] = const SizedBox(
  //     width: 55,
  //     height: 75,
  //   );
  //   userCards.remove(data[1]);
  //   if (userPlay.length > computerPlay.length) {
  //     player = 2;
  //     userPlayCards.add(
  //       Carte(card: data[1], open: true),
  //     );
  //   } else {
  //     bool check;
  //     bool show = faceUpCard(
  //         userPlay[userPlay.length - 1], computerPlay[computerPlay.length - 1]);
  //     show
  //         ? {
  //             check = checkmax(userPlay[userPlay.length - 1],
  //                 computerPlay[computerPlay.length - 1]),
  //             check
  //                 ? {
  //                     userPlayCards.add(
  //                       Carte(card: data[1], open: true),
  //                     ),
  //                     player = 1
  //                   }
  //                 : {
  //                     userPlayCards.add(
  //                       Carte(card: data[1], open: true),
  //                     ),
  //                     player = 2
  //                   }
  //           }
  //         : {
  //             userPlayCards.add(
  //               Carte(card: data[1], open: false),
  //             ),
  //             player = 2,
  //           };
  //   }
  // }

  @override
  void dispose() {
    for (var obj in computer.cards) {
      obj.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        final shouldPop = await askExitGame(context, scorePlayer);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              // Image.asset(
              //   "images/logo2.png",
              //   height: 40,
              //   width: 40,
              //   // color: Colors.white,
              // ),
              IconButton(
                padding: const EdgeInsets.only(bottom: 10),
                icon: const Icon(Icons.home_rounded,
                    size: 40, color: Colors.white),
                onPressed: () {
                  askExitGame(context, scorePlayer);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "SIPA",
                  style: TextStyle(fontFamily: 'Cardinal', fontSize: 30),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  dernier = 'computer';
                });
                sameColorCard
                    ? showRestart(context, whoTakeIt)
                    : showWinner(context, dernier);
                // settingModalBottomSheet(context, dernier);
                sameColorCard ? null : scoreComputer = scoreComputer + 1;
              },
              icon: const Icon(Icons.autorenew),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF225577),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(children: [
                      Column(
                        children: [
                          Text(
                            computer.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          //const SizedBox(height: 30),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFBBCEE8),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          Text(
                            'Score : $scoreComputer',
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: sameColorCard
                            ? computer.cards.map((e) {
                                return Carte(e.rank.value, e.rank.label,
                                    canMove: currentPlayer == computer.id);
                              }).toList()
                            : computer.cards.map((e) {
                                return Carte(
                                    animationController: e.animationController,
                                    e.rank.value,
                                    e.rank.label,
                                    faceUp:
                                        true, // TODO To be changed to false //
                                    canMove: currentPlayer == computer.id);
                              }).toList(),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 250,
                      width: 300,
                      //color: Colors.black,
                      child: DragTarget(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFF2A384B),
                            ),
                            child: sameColorCard
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        '$whoTakeIt only has cards of same color. Restart the game',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        computerPlayCards.isEmpty
                                            ? const SizedBox(
                                                width: 55,
                                                height: 75,
                                              )
                                            : Row(
                                                children: computerPlayCards
                                                    .map((e) => e)
                                                    .toList(),
                                              ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 60.0),
                                          child: Row(
                                            children: userPlayCards
                                                .map((e) => e)
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          );
                        },
                        onAccept: (Rank data) {
                          print({data.label, data.value});

                          void addCard(bool shouldFlip) {
                            final Carte addedCard =
                                Carte(data.value, data.label);
                            addedCard.faceUp = shouldFlip;
                            if (currentPlayer == player.id) {
                              userPlayCards.add(addedCard);
                              player.removeCard(data);
                            } else {
                              computerPlayCards.add(addedCard);
                              computer.removeComputerCard(data);
                            }
                          }

                          if (askedCard == null) {
                            askedCard = data;
                            addCard(true);
                            nextPlayer();
                            print(currentPlayer);
                            if (currentPlayer == computer.id) {
                              compPlay();
                            }
                            return;
                          }

                          if (askedCard!.label != data.label) {
                            askedCard = null;
                            addCard(false);
                            nextPlayer();
                            print("currentPlayer $currentPlayer");
                            compPlay();
                            setState(() {
                              // Update all variables
                            });
                            return;
                          }

                          if (askedCard!.label == data.label &&
                              askedCard!.value < data.value) {
                            addCard(true);
                            askedCard = null;
                            compPlay();
                          } else {
                            addCard(true);
                            askedCard = null;
                            nextPlayer();
                            compPlay();
                          }

                          setState(() {
                            // Update all variables
                          });

                          // if (data[0] == "user") {
                          //   if (computerPlay.length > userPlay.length) {
                          //     bool accept = false;
                          //     for (var item in userCards) {
                          //       var a = item.substring(0, 2);
                          //       var b = computerPlay[computerPlay.length - 1]
                          //           .substring(0, 2);
                          //       a == b ? accept = true : null;
                          //     }
                          //     if (accept) {
                          //       if (data[1].substring(0, 2) ==
                          //           computerPlay[computerPlay.length - 1]
                          //               .substring(0, 2)) {
                          //         uPlay(data);
                          //       }
                          //     }
                          //     if (accept == false) {
                          //       uPlay(data);
                          //     }
                          //   } else {
                          //     uPlay(data);
                          //   }

                          //   if (computerPlay.length == 5 &&
                          //       userPlay.length == 5) {
                          //     bool same =
                          //         faceUpCard(userPlay.last, computerPlay.last);
                          //     bool max;
                          //     same
                          //         ? {
                          //             max = checkmax(
                          //                 userPlay.last, computerPlay.last),
                          //             max
                          //                 ? setState(() {
                          //                     dernier = 'user';
                          //                   })
                          //                 : setState(() {
                          //                     dernier = 'computer';
                          //                   }),
                          //           }
                          //         : setState(() {
                          //             dernier = 'computer';
                          //           });
                          //     player = 0;
                          //     if (dernier == 'user') {
                          //       scorePlayer = scorePlayer + 1;
                          //     } else {
                          //       scoreComputer = scoreComputer + 1;
                          //     }
                          //     Future.delayed(const Duration(milliseconds: 500))
                          //         .then((value) =>
                          //             showWinner(context, dernier, clean));
                          //   }
                          // }
                          // while (player == 2) {
                          //   cPlay();
                          // }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(children: [
                        Column(
                          children: [
                            Text(
                              player.name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            //const SizedBox(height: 30),
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFBBCEE8),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 40,
                              ),
                            ),
                            Text(
                              'Score : $scorePlayer',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        sameColorCard
                            ? Row(
                                children: player.cards.map((e) {
                                return Carte(e.value, e.label,
                                    canMove: currentPlayer == player.id);
                              }).toList())
                            : Row(
                                children: player.cards.map((e) {
                                  return Carte(e.value, e.label,
                                      canMove: currentPlayer == player.id);
                                }).toList(),
                              ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void settingModalBottomSheet(context, String winner) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 40,
                left: 90,
                child: Text(
                  "${winner.toUpperCase()} WIN",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.lime,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Transform.rotate(
                    angle: -math.pi / 17.0,
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(5),

                      // ignore: deprecated_member_use
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              // side:
                              //     BorderSide(width: 2.0, color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: const Center(
                          child: Text(
                            'Replay',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        onPressed: () {
                          playCards.clear();
                          playCards.addAll(cartes);
                          // clean();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      isDismissible: false,
      enableDrag: false,
    );
  }
}
