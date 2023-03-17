import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipa/logic/playing_logic.dart';
import 'package:sipa/logic/score.dart';
import 'package:sipa/screen/game_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.storage}) : super(key: key);
  final ScoreStorage storage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.storage.readCounter().then((value) {
      setState(() {
        allScores = value;
        scores = allScores.split('\n');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await askExit(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white38,
        body: Stack(children: [
          // Image.asset(
          //   'assets/arr1.jpg',
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   fit: BoxFit.fill,

          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Center(
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          'SIPA',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Cardinal',
                            letterSpacing: 4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Image.asset(
                          'assets/sipa.gif',
                          width: 200,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(2.0, 3.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[600],
                    shape: RoundedRectangleBorder(
                        // side:
                        //     BorderSide(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    askPseudo(context);
                  },
                  child: const Text(
                    "Play",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 125,
                height: 45,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(2.0, 3.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        // side:
                        //     BorderSide(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    setState(() {
                      scores;
                    });
                    showScores(context);
                  },
                  child: const Text(
                    "Scores",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

TextEditingController userName = TextEditingController();

askPseudo(BuildContext context) => showDialog(
    context: context,
    builder: (context) => Dialog(
          backgroundColor: const Color(0xFF225577),
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
                  const Text(
                    "Entrer votre pseudo",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: userName,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white54),
                        hintText: 'Player',
                        isCollapsed: true,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomRight,
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
                        if (userName.text.isEmpty) {
                        } else {
                          playerName = userName.text;
                        }
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Screen()),
                            (route) => false);
                      },
                      child: const Text(
                        "Valider",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));

showScores(BuildContext context) => showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF225577),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: SizedBox(
          height: 400,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 320,
                  child: ListScore(),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Retour",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

class ListScore extends StatefulWidget {
  const ListScore({Key? key}) : super(key: key);

  @override
  _ListScoreState createState() => _ListScoreState();
}

class _ListScoreState extends State<ListScore> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      controller: scrollController,
      thickness: 10,
      thicknessWhileDragging: 5,
      radius: const Radius.circular(10),
      radiusWhileDragging: const Radius.circular(10),
      // hoverThickness: 30.0,
      child: scores.isEmpty
          ? const Text(
              'Empty',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          : ListView.builder(
              controller: scrollController,
              itemCount: scores.length - 1,
              itemBuilder: (BuildContext context, index) {
                List x = scores[index].toString().split(" ");
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Text(
                          x[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        x[x.length - 1],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
