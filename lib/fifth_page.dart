import 'dart:math';

import 'package:animation/fourth_page.dart';
import 'package:animation/main.dart';
import 'package:flutter/material.dart';

class FifthPage extends StatefulWidget {
  FifthPage({Key key}) : super(key: key);

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  // Animation _colorAnimation;
  // Animation _sizeAnimation;
  Animation _rotationAnimation;
  Animation _dropAnimation;
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
    _dropAnimation = Tween<double>(
      begin: 0,
      end: MediaQuery.of(context).size.width,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _displaceAnimation = Tween<double>(
      begin: 0,
      end: MediaQuery.of(context).size.width - 50,
    ).animate(_controller);

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
              top: _dropAnimation.value + 100,
              left: _displaceAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: SGColors.apple,
                  ),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: LetterP(),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width + 200,
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
            return FourthPage();
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
