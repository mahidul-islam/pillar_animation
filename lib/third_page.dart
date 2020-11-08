import 'dart:math';

import 'package:animation/fourth_page.dart';
import 'package:animation/main.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
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
      duration: Duration(seconds: 1),
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
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  height: 100,
                  width: 100,
                  color: SGColors.neonRed,
                ),
              ),
            ),
            _backButton(context),
            _nextPageButton(context),
            _pausePlayButton(context),
          ],
        ),
      ),
    );
  }

  Widget _pausePlayButton(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 72,
      child: Column(
        children: [
          FloatingActionButton(
            heroTag: 'two',
            onPressed: () {
              _controller.repeat();
            },
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            heroTag: 'one',
            onPressed: () {
              _controller.stop();
            },
            child: Icon(Icons.pause),
          ),
        ],
      ),
    );
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
              return HomePage();
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
}
