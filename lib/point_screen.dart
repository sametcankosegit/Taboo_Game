import 'package:flutter/material.dart';
import 'package:tabu_game/taboo_game.dart';

class PointsPage extends StatefulWidget {
  final int teamOnePoints;
  final int teamTwoPoints;

  PointsPage({required this.teamOnePoints, required this.teamTwoPoints});

  @override
  _PointsPageState createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  int teamOnePoints = 0;
  int teamTwoPoints = 0;

  @override
  void initState() {
    super.initState();
    teamOnePoints = widget.teamOnePoints;
    teamTwoPoints = widget.teamTwoPoints;
  }

  void updatePoints(int teamNumber, int pointsToAdd) {
    setState(() {
      if (teamNumber == 1) {
        teamOnePoints += pointsToAdd;
      } else if (teamNumber == 2) {
        teamTwoPoints += pointsToAdd;
      }
    });
  }

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabooGame()),
                );
              },
            );
          },
        ),
        title: Text('Puan Sayfası'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Puanlar: $teamOnePoints - $teamTwoPoints',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updatePoints(1, 1); // 1. takıma 1 puan eklemek için
              },
              child: Text('1. Takıma Puan Ekle'),
            ),
            ElevatedButton(
              onPressed: () {
                updatePoints(2, 1); // 2. takıma 1 puan eklemek için
              },
              child: Text('2. Takıma Puan Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
