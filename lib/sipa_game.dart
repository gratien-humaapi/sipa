// import 'dart:math';
// import 'dart:ui';

// import 'package:flame/camera.dart';
// import 'package:flame/components.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/game.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sipa/components/computer_hand.dart';
// import 'package:sipa/components/player_hand.dart';
// import 'package:sipa/components/stock.dart';
// import 'package:sipa/components/table.dart';
// import 'cards.dart';
// import 'components/card.dart';

// class SipaGame extends FlameGame {
//   late SpriteComponent background;
//   late TextComponent computerText;
//   late TextComponent playerText;

//   static const double cardGap = 175.0 * 0.4;
//   static const double cardWidth = 1000.0 * 0.4;
//   static const double cardHeight = 1400.0 * 0.4;
//   static const double cardRadius = 100.0 * 0.4;
//   static final Vector2 cardSize = Vector2(cardWidth, cardHeight);
//   static final Vector2 gameTableSize = Vector2(cardWidth * 6, cardHeight * 5);
//   static final cardRRect = RRect.fromRectAndRadius(
//     const Rect.fromLTWH(0, 0, cardWidth, cardHeight),
//     const Radius.circular(cardRadius),
//   );

//   @override
//   Color backgroundColor() => const Color.fromARGB(255, 24, 60, 137);

//   @override
//   Future<void> onLoad() async {
//     await Flame.images.load('klondike-sprites.png');
//     await Flame.images.load('table.jpg');
//     for (var carte in cartes) {
//       await Flame.images.load(carte.path);
//     }
//     // Arrière-plan
//     background = SpriteComponent(
//       sprite: await loadSprite('background.jpg'),
//       size: size,
//     );
//     // add(background);

//     // // Textes UI
//     // computerText = TextComponent(
//     //   text: "Computer",
//     //   position: Vector2(50, 50),
//     //   // Vous pouvez ajouter d'autres propriétés pour le style ici
//     // );
//     // add(computerText);

//     // playerText = TextComponent(
//     //   text: "Player",
//     //   position: Vector2(50, size.y - 50), // exemple de positionnement en bas
//     //   // Ajoutez d'autres propriétés pour le style ici
//     // );
//     // add(playerText);

//     Vector2 screenSize = size; // Accessing the size property

//     print('Screen width: ${screenSize.x}');
//     print('Screen height: ${screenSize.y}');

//     final stock = StockPile()
//       ..size = cardSize
//       ..position = Vector2(cardGap, cardGap * 25);

//     final gameTable = GameTable()
//       // ..size = gameTableSize
//       ..position = Vector2(size.x, size.y);

//     final computerHand = List.generate(
//       5,
//       (i) => ComputerHand(
//         position: Vector2(
//           cardGap + i * (cardWidth + cardGap),
//           cardGap,
//         ),
//       ),
//     );

//     final playerHand = List.generate(
//       5,
//       (i) => ComputerHand(
//         position: Vector2(
//           cardGap + i * (cardWidth + cardGap),
//           cardHeight + 50 * cardGap,
//         ),
//       ),
//     );

//     final world = World()
//       ..add(stock)
//       ..add(gameTable)
//       ..addAll(computerHand)
//       ..addAll(playerHand);
//     add(world);

//     final camera = CameraComponent(
//       world: world,
//       viewport: FixedSizeViewport(screenSize.x, screenSize.y),
//     )
//       // ..viewport = FixedSizeViewport(size.x, size.y)
//       ..backdrop = background
//       // ..viewfinder.visibleGameSize =
//       //     Vector2(cardWidth * 7 + cardGap * 8, 4 * cardHeight + 3 * cardGap)
//       // ..viewfinder.position = Vector2(cardWidth * 3.5 + cardGap * 4, 0)
//       ..viewfinder.anchor = Anchor.topCenter
//       ..viewfinder.zoom = 0.1;
//     add(camera);

//     final cards = [
//       for (var rank = 7; rank <= 13; rank++)
//         for (var suit in ['s', 'h', 'c', 'd']) Card(rank, suit),
//     ];
//     cards.shuffle();
//     world.addAll(cards);

//     for (var i = 0; i < 5; i++) {
//       computerHand[i].acquireCard(cards.removeLast());
//       // computerHand[i].flipTopCard();
//     }

//     for (var i = 0; i < 5; i++) {
//       playerHand[i].acquireCard(cards.removeLast());
//       playerHand[i].flipTopCard();
//     }
//     print(cards.length);
//     cards.forEach(stock.acquireCard);
//   }
// }

// Sprite flameSprite() {
//   return Sprite(
//     Flame.images.fromCache('klondike-sprites.png'),
//     srcPosition: Vector2(1367, 6),
//     srcSize: Vector2(357, 501),
//   );
// }

// Sprite tableSprite() {
//   return Sprite(
//     Flame.images.fromCache('table.jpg'),
//   );
// }

// Widget cardSprite(String path) {
//   return Sprite(
//     Flame.images.fromCache(path),
//   );
// }
