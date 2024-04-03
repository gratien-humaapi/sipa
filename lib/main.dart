import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipa/screen/game_screen.dart';
import 'package:sipa/screen/intro.dart';
import 'package:sipa/sipa_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await Flame.device.setPortrait();
  // final game = SipaGame();
  // runApp(GameWidget(game: game));
  // runApp(const AnimatedPositionedExampleApp());
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
        home: Screen()
        // IntroPage(),
        );
  }
}

// class AnimatedPositionedExampleApp extends StatelessWidget {
//   const AnimatedPositionedExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('AnimatedPositioned Sample')),
//         body: const Center(
//           child: AnimatedPositionedExample(),
//         ),
//       ),
//     );
//   }
// }

// class AnimatedPositionedExample extends StatefulWidget {
//   const AnimatedPositionedExample({super.key});

//   @override
//   State<AnimatedPositionedExample> createState() =>
//       _AnimatedPositionedExampleState();
// }

// class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
//   bool selected = false;
//   int animation_speed = 0;
//   double initial_x = 50;
//   double initial_y = 50;
//   late double x = initial_x;
//   late double y = initial_y;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 350,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: <Widget>[
//           AnimatedPositioned(
//             top: y,
//             left: x,
//             duration: Duration(seconds: animation_speed),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {},
//               child: Draggable<int>(
//                 key: const Key('mywidgetkey'),
//                 onDragStarted: () {},
//                 onDragUpdate: (details) => {
//                   setState(() {
//                     animation_speed = 0;
//                     x = x + details.delta.dx;
//                     y = y + details.delta.dy;
//                   })
//                 },
//                 onDraggableCanceled: (velocity, offset) {
//                   setState(() {
//                     animation_speed = 2;
//                     x = initial_x;
//                     y = initial_y;
//                   });
//                 },
//                 onDragEnd: (details) {},
//                 data: 10,
//                 feedback: Container(
//                   color: Colors.deepOrange,
//                   height: 100,
//                   width: 100,
//                   child: const Icon(Icons.directions_run),
//                 ),
//                 childWhenDragging: Container(
//                   height: 100.0,
//                   width: 100.0,
//                   color: Colors.pinkAccent,
//                   child: const Center(
//                     child: Text('Child When Dragging'),
//                   ),
//                 ),
//                 child: Container(
//                   height: 100.0,
//                   width: 100.0,
//                   color: Colors.lightGreenAccent,
//                   child: const Center(
//                     child: Text('Draggable'),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
