import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tabu_game/point_screen.dart';
import 'package:tabu_game/taboo_game.dart';

class TimeCounter extends StatefulWidget {
  final int? teamOnePoints;
  final int? teamTwoPoints;

  TimeCounter({
    this.teamOnePoints,
    this.teamTwoPoints,
  });

  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  int _counter = 130;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PointsPage(
                teamOnePoints: widget.teamOnePoints ?? 0,
                teamTwoPoints: widget.teamTwoPoints ?? 0,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_counter seconds',
      style: TextStyle(fontSize: 24.0),
    );
  }
}
