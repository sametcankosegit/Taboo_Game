/*import 'package:flutter/material.dart';
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
*/
import 'package:flutter/material.dart';
import 'package:tabu_game/taboo_game.dart';

class PointsPage extends StatefulWidget {
  @override
  _PointsPageState createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  int teamOnePoints = 0;
  int teamTwoPoints = 0;

  void addPoint(int team) {
    setState(() {
      if (team == 1) {
        teamOnePoints++;
      } else if (team == 2) {
        teamTwoPoints++;
      }
    });
  }

  void subtractPoint(int team) {
    setState(() {
      if (team == 1 && teamOnePoints > 0) {
        teamOnePoints--;
      } else if (team == 2 && teamTwoPoints > 0) {
        teamTwoPoints--;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Takım 1',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  '$teamOnePoints',
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => subtractPoint(1),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => addPoint(1),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Takım 2',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  '$teamTwoPoints',
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => subtractPoint(2),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => addPoint(2),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
