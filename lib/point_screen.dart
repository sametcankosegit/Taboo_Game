import 'package:flutter/material.dart';
import 'package:tabu_game/taboo_game.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.red,
              ],
            ),
          ),
        ),
        title: Text('Puan Sistemi'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffe66465), Color(0xff9198e5)],
          ),
        ),
        child: ElevatedButton(
          child: Text('Geri Dön'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TabooGame()),
            );
          },
        ),
      ),
    );
  }
}
