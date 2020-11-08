import 'dart:math';

import 'package:animation/main.dart';
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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_controller);

    // _colorAnimation = ColorTween(
    //   begin: Colors.blue,
    //   end: Colors.yellow,
    // ).animate(_controller);

    // _sizeAnimation = Tween<double>(
    //   begin: 100.0,
    //   end: 200.0,
    // ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
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
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (BuildContext context) {
        //     return FourthPage();
        //   },
        // ));
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
