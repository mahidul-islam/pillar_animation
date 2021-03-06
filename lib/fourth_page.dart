import 'dart:math';

import 'package:animation/main.dart';
import 'package:animation/second_page.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  FourthPage({Key key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  // Animation _colorAnimation;
  // Animation _sizeAnimation;
  Animation _rotationAnimation;
  Animation _displaceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.repeat();

    _do();

    // _colorAnimation = ColorTween(
    //   begin: Colors.blue,
    //   end: Colors.yellow,
    // ).animate(_controller);

    // _sizeAnimation = Tween<double>(
    //   begin: 100.0,
    //   end: 200.0,
    // ).animate(_controller);
  }

  _do() async {
    await Future.delayed(const Duration(milliseconds: 50));
    _displaceAnimation = Tween<double>(
      begin: 0,
      end: MediaQuery.of(context).size.width,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 4 * pi,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: _displaceAnimation.value + 100,
              left: MediaQuery.of(context).size.width / 2 + 50,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  color: SGColors.apple,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Positioned(
              top: _displaceAnimation.value + 100,
              left: MediaQuery.of(context).size.width / 2 - 100,
              child: Container(
                color: SGColors.orangeyRed,
                height: 50,
                width: 50,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width + 150,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: SGColors.charcoalGrey,
              ),
            ),
            _backButton(context),
            _nextPageButton(context),
          ],
        ),
      ),
    );
  }
}

Widget _nextPageButton(BuildContext context) {
  return Positioned(
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
        'Next Page',
        style: TextStyle(color: SGColors.white),
      ),
    ),
  );
}

Widget _backButton(BuildContext context) {
  return Positioned(
    left: 10,
    top: 40,
    child: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios),
    ),
  );
}
