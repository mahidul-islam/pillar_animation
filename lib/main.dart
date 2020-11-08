import 'dart:math';
import 'package:animation/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _endValue = 0;
  static final sinePeriod = 2 * pi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _endValue),
              duration: Duration(milliseconds: 2000),
              builder: (_, double value, Widget child) {
                double offset = sin(value);
                return Transform.translate(
                  offset: Offset(0, offset * 100),
                  child: child,
                );
              },
              child: LetterP(),
            ),
            Positioned(
              top: 50,
              right: 50,
              child: FadedLetterP(),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: RotatedLetterP(),
            ),
            Positioned(
              bottom: 100,
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    height: double.infinity,
                    color: SGColors.greenBlue,
                    onPressed: () {
                      setState(() {
                        _endValue = sinePeriod;
                      });
                    },
                    child: Text(
                      'Start !!!',
                      style: TextStyle(color: SGColors.white),
                    ),
                  ),
                  MaterialButton(
                    color: SGColors.greenBlue,
                    height: double.infinity,
                    onPressed: () {
                      setState(() {
                        _endValue = 0;
                      });
                    },
                    child: Text(
                      'Stop ...',
                      style: TextStyle(color: SGColors.white),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                height: double.infinity,
                color: SGColors.greenBlue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SecondPage();
                    },
                  ));
                },
                child: Text(
                  'Second Page',
                  style: TextStyle(color: SGColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LetterP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'P',
      style: TextStyle(
        color: SGColors.blue,
        fontFamily: 'SFProText',
        fontSize: 56,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class FadedLetterP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 100),
      opacity: 0.5,
      child: LetterP(),
    );
  }
}

class RotatedLetterP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: LetterP(),
    );
  }
}

class SGColors {
  static const Color blue = Color(0xff0044cc);
  static const Color ceruleanBlue = Color(0xff0075f4);
  static const Color greenBlue = Color(0xff00d277);
  static const Color marigold = Color(0xffffc000);
  static const Color neonRed = Color(0xffff0036);
  static const Color cornflower = Color(0xff6858ff);
  static const Color dark = Color(0xff181c23);
  static const Color charcoalGrey = Color(0xff3f4755);
  static const Color battleshipGrey = Color(0xff70798a);
  static const Color blueyGrey = Color(0xff979faf);
  static const Color lightBlueGrey = Color(0xffc1c7d2);
  static const Color veryLightBlue = Color(0xffe6e8ed);
  static const Color paleGrey = Color(0xfff5f6f8);
  static const Color white = Color(0xffffffff);
  static const Color apple = Color(0xff80c93c);
  static const Color tangerine = Color(0xffff900e);
  static const Color reddishOrange = Color(0xffff601b);
  static const Color orangeyRed = Color(0xffff3029);
  static const Color pinkyRed = Color(0xffff1f4e);
  static const Color statusBarColor = Color(0xffffffff);
}
