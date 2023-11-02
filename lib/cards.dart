class CardInfo {
  final int value;
  final String path;
  final String label;

  CardInfo({required this.value, required this.path, required this.label});
}

List<CardInfo> cartes = [
  // Squares ♦️
  CardInfo(value: 7, path: "assets/images/ca07.png", label: "d"),
  CardInfo(value: 8, path: "assets/images/ca08.png", label: "d"),
  CardInfo(value: 9, path: "assets/images/ca09.png", label: "d"),
  CardInfo(value: 10, path: "assets/images/ca10.png", label: "d"),
  CardInfo(value: 11, path: "assets/images/ca11.png", label: "d"),
  CardInfo(value: 12, path: "assets/images/ca12.png", label: "d"),
  CardInfo(value: 13, path: "assets/images/ca13.png", label: "d"),

  // Heart ♥️
  CardInfo(value: 7, path: "assets/images/co07.png", label: "h"),
  CardInfo(value: 8, path: "assets/images/co08.png", label: "h"),
  CardInfo(value: 9, path: "assets/images/co09.png", label: "h"),
  CardInfo(value: 10, path: "assets/images/co10.png", label: "h"),
  CardInfo(value: 11, path: "assets/images/co11.png", label: "h"),
  CardInfo(value: 12, path: "assets/images/co12.png", label: "h"),
  CardInfo(value: 13, path: "assets/images/co13.png", label: "h"),

  // Clover ♣️
  CardInfo(value: 7, path: "assets/images/tr07.png", label: "c"),
  CardInfo(value: 8, path: "assets/images/tr08.png", label: "c"),
  CardInfo(value: 9, path: "assets/images/tr09.png", label: "c"),
  CardInfo(value: 10, path: "assets/images/tr10.png", label: "c"),
  CardInfo(value: 11, path: "assets/images/tr11.png", label: "c"),
  CardInfo(value: 12, path: "assets/images/tr12.png", label: "c"),
  CardInfo(value: 13, path: "assets/images/tr13.png", label: "c"),

  // Spades ♠️
  CardInfo(value: 7, path: "assets/images/pi07.png", label: "s"),
  CardInfo(value: 8, path: "assets/images/pi08.png", label: "s"),
  CardInfo(value: 9, path: "assets/images/pi09.png", label: "s"),
  CardInfo(value: 10, path: "assets/images/pi10.png", label: "s"),
  CardInfo(value: 11, path: "assets/images/pi11.png", label: "s"),
  CardInfo(value: 12, path: "assets/images/pi12.png", label: "s"),
  CardInfo(value: 13, path: "assets/images/pi13.png", label: "s"),
];
