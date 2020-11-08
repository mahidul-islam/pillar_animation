import 'package:animation/third_page.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorAnimation;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _colorAnimation = ColorTween(
      begin: SGColors.ceruleanBlue,
      end: SGColors.greenBlue,
    ).animate(_controller);

    _sizeAnimation = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(_controller);

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
            _backButton(context),
            Center(
              child: Container(
                height: _sizeAnimation.value,
                width: _sizeAnimation.value,
                color: _colorAnimation.value,
              ),
            ),
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
            return ThirdPage();
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
