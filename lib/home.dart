import 'package:flutter/material.dart';
import 'package:busanimation/point.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Point _point = Point(1110.0, 200.0, 0.0, 0.0, 0.0, Duration());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(centerTitle: true, title: Text('Bus Animation')),
      body: _body(),
      floatingActionButton: _floatActionButton(),
    );
  }

  _body() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: _point.duration,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(_point.orientation / 360),
                child: Image.asset('assets/car.png'),
              ),
              left: _point.left,
              top: _point.top,
              right: _point.right,
              bottom: _point.bottom,
            ),
          ],
        ),
      ),
    );
  }

  _floatActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      backgroundColor: Colors.green,
      onPressed: _startAnimation,
    );
  }

  void _startAnimation() async {
//    LTRB
    List<Point> points = [
      Point(1110.0, 0.0, 0.0, 100.0, 0, Duration(seconds: 1)),
      Point(1080.0, 0.0, 0.0, 130.0, -45, Duration(milliseconds: 500)),
      Point(0.0, 0.0, 600.0, 700.0, -70, Duration(seconds: 4)),
      Point(0.0, 0.0, 900.0, 700.0, -90, Duration(seconds: 1)),
      Point(0.0, 0.0, 1050.0, 650.0, -110, Duration(seconds: 1)),
      Point(0.0, 300.0, 1080.0, 0.0, 180, Duration(seconds: 3)),
      Point(0.0, 350.0, 1000.0, 0.0, 145, Duration(seconds: 1)),
      Point(0.0, 80.0, 0.0, 0.0, 75, Duration(seconds: 2)),
      Point(500.0, 600.0, 0.0, 0.0, 145, Duration(seconds: 2)),
      Point(900.0, 620.0, 0.0, 0.0, 90, Duration(seconds: 1)),
      Point(1000.0, 550.0, 0.0, 0.0, 45, Duration(seconds: 1)),
      Point(1110.0, 200.0, 0.0, 0.0, 0, Duration(seconds: 1)),
    ];

    for (Point point in points) {
      setState(() => _point = point);
      await Future.delayed(_point.duration);
    }
  }
}
