import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sipa/logic/get_card.dart';
import 'package:sipa/logic/playing_logic.dart';
import 'package:sipa/logic/score.dart';
import 'package:sipa/logic/start_game.dart';
import 'package:sipa/models/player.dart';
import 'package:sipa/rank.dart';
import 'package:sipa/screen/get_pseudo.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int scorePlayer = 0;
  int scoreComputer = 0;
  List<Widget> userPlayCards = [];
  List<Widget> computerPlayCards = [];
  List<String> userPlay = [];
  List computerPlay = [];
  bool sameColorCard = false;

  Rank? askedCard;

  String currentPlayer = '2';

  List<Player> players = [
    Player(name: "Computer", id: '1'),
    Player(name: 'John', id: '2')
  ];

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
    giveCards(players);
    // clean();
    super.initState();
  }

  // void cPlay() {
  //   setState(
  //     () {
  //       int i = 8;
  //       for (var item in computerCards) {
  //         var a = item.substring(0, 2);
  //         var b = userPlay[userPlay.length - 1].substring(0, 2);
  //         print("$a $b");
  //         a == b ? i = computerCards.indexOf(item) : null;
  //         print(i);
  //       }
  //       i == 8 ? i = entierAleatoire(0, computerCards.length - 1) : null;
  //       print(i);
  //       computerPlay.add(computerCards[i]);
  //       print(computer);
  //       print(computer.indexOf(computerPlay[computerPlay.length - 1]));
  //       computerPlaceHolder[computer
  //           .indexOf(computerPlay[computerPlay.length - 1])] = const SizedBox(
  //         width: 55,
  //         height: 75,
  //       );
  //       computerCards.remove(computerCards[i]);
  //       if (computerPlay.length == userPlay.length) {
  //         bool check;
  //         bool show = faceUpCard(userPlay[userPlay.length - 1],
  //             computerPlay[computerPlay.length - 1]);
  //         show
  //             ? {
  //                 check = checkmax(userPlay[userPlay.length - 1],
  //                     computerPlay[computerPlay.length - 1]),
  //                 check
  //                     ? {
  //                         computerPlayCards
  //                             .add(Carte(card: computerPlay.last, open: true)),
  //                         player = 1
  //                       }
  //                     : {
  //                         computerPlayCards
  //                             .add(Carte(card: computerPlay.last, open: true)),
  //                         player = 2
  //                       }
  //               }
  //             : {
  //                 computerPlayCards.add(
  //                   Carte(card: computerPlay.last, open: false),
  //                 ),
  //                 player = 1,
  //               };
  //       } else {
  //         computerPlayCards.add(
  //           Carte(card: computerPlay.last, open: true),
  //         );
  //         player = 1;
  //       }
  //     },
  //   );
  //   if (computerPlay.length == 5 && userPlay.length == 5) {
  //     bool same = faceUpCard(userPlay.last, computerPlay.last);
  //     bool max;
  //     same
  //         ? {
  //             max = checkmax(userPlay.last, computerPlay.last),
  //             max
  //                 ? setState(() {
  //                     dernier = 'user';
  //                   })
  //                 : setState(() {
  //                     dernier = 'computer';
  //                   }),
  //           }
  //         : setState(() {
  //             dernier = 'user';
  //           });
  //     player = 0;
  //     if (dernier == 'user') {
  //       scorePlayer = scorePlayer + 1;
  //     } else {
  //       scoreComputer = scoreComputer + 1;
  //     }
  //     setState(() {});
  //     Future.delayed(const Duration(milliseconds: 500))
  //         .then((value) => showWinner(context, dernier, clean));
  //   }
  // }

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
                            players[0].name,
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
                            ? players[0].cards.map((e) {
                                e.flip();
                                return e;
                              }).toList()
                            :
                            // players[0].cards.map((e) => e).toList(),
                            players[0].cards.map((e) {
                                e.canMove = currentPlayer == players[0].id;
                                print('computer can move: ${e.canMove}');
                                if (e.isFaceDown) {
                                  e.flip();
                                }
                                return e;
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
                                                children: computerPlayCards,
                                              ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 60.0),
                                          child: Row(
                                            children: userPlayCards,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          );
                        },
                        onAccept: (Rank data) {
                          // print({data.label, data.value});
                          // if (askedCard == null) {
                          //   askedCard = data;
                          //   if (currentPlayer == players[1].id) {
                          //     userPlayCards
                          //         .add(Carte(data.value, data.label)..flip());
                          //   } else {
                          //     computerPlayCards
                          //         .add(Carte(data.value, data.label));
                          //   }
                          //   setState(() {});
                          // } else if (askedCard!.label == data.label) {
                          //   if (currentPlayer == players[1].id) {
                          //     askedCard = data;
                          //     userPlayCards
                          //         .add(Carte(data.value, data.label)..flip());
                          //   } else {
                          //     computerPlayCards
                          //         .add(Carte(data.value, data.label)..flip());
                          //   }
                          //   setState(() {});
                          // } else {
                          //     if (currentPlayer == players[1].id) {
                          //     askedCard = data;
                          //     userPlayCards
                          //         .add(Carte(data.value, data.label));
                          //   } else {
                          //     computerPlayCards
                          //         .add(Carte(data.value, data.label));
                          //   }
                          //   setState(() {});
                          // }

                          print({data.label, data.value});

                          void addCard(bool shouldFlip) {
                            final Carte addedCard =
                                Carte(data.value, data.label);
                            if (shouldFlip) {
                              addedCard.flip();
                            }
                            if (currentPlayer == players[1].id) {
                              userPlayCards.add(addedCard);
                              players[1].removeCard(data);
                            } else {
                              computerPlayCards.add(addedCard);
                              players[0].removeCard(data);
                            }
                          }

                          if (askedCard == null) {
                            askedCard = data;
                            addCard(true);
                            currentPlayer =
                                currentPlayer == '1' ? '2' : currentPlayer;
                            print(currentPlayer);
                          } else if (askedCard!.label == data.label) {
                            if (askedCard!.value < data.value) {
                              currentPlayer =
                                  currentPlayer == '1' ? '2' : currentPlayer;
                            }
                            addCard(true);
                            askedCard = null;
                          } else {
                            addCard(false);
                            askedCard = null;
                            currentPlayer =
                                currentPlayer == '1' ? '2' : currentPlayer;
                          }

                          setState(() {
                            print("object");
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
                              players[1].name,
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
                                children: players[1].cards.map((e) {
                                if (e.isFaceDown) {
                                  e.flip();
                                }
                                return e;
                              }).toList())
                            : Row(
                                children: players[1].cards.map((e) {
                                  e.canMove = currentPlayer == players[1].id;
                                  if (e.isFaceDown) {
                                    e.flip();
                                  }
                                  return e;
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
