import 'package:flutter/material.dart';
import 'package:sipa/logic/score.dart';
import 'package:sipa/screen/get_pseudo.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController lottieAnimation;
  var expended = false;
  double bigFontSize = 250;
  final transitionDuration = const Duration(seconds: 1);
  bool show = false;

  @override
  void initState() {
    lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => {expended = true, show = true}))
        .then((value) => const Duration(seconds: 2))
        .then((value) => Future.delayed(const Duration(seconds: 1)).then(
            (value) => lottieAnimation
                .forward()
                .then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              storage: ScoreStorage(),
                            )),
                    (route) => false))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xFF225577),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: transitionDuration,
                  curve: Curves.fastOutSlowIn,
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Cardinal',
                    fontSize: !expended ? bigFontSize : 50,
                    fontWeight: FontWeight.w600,
                  ),
                  child: const Text('S'),
                ),
                AnimatedCrossFade(
                  firstCurve: Curves.fastOutSlowIn,
                  crossFadeState: !expended
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: transitionDuration,
                  firstChild: Container(),
                  secondChild: const Text(
                    'IPA',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Cardinal',
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  sizeCurve: Curves.easeInOut,
                ),
              ],
            ),
            show
                ? Image.asset(
                    'assets/sipa.gif',
                    width: 200,
                    height: 200,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
