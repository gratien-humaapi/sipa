import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipa/screen/intro.dart';
import 'package:sipa/sipa_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await Flame.device.setPortrait();
  // final game = SipaGame();
  // runApp(GameWidget(game: game));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sipa ♠️♣️🧡🔶',
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
