import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(TabooGame());
}

class TabooGame extends StatefulWidget {
  @override
  _TabooGameState createState() => _TabooGameState();
}

class _TabooGameState extends State<TabooGame> {
  List<String> words = ['Bisiklet', 'Ölüm', 'Sinema', 'Yemek', 'Futbol'];

  List<List<String>> tabooWords = [
    ['Teker', 'Motosiklet', 'Pedal'],
    ['Yaşam', 'Ahiret', 'Mezar'],
    ['Film', 'Yönetmen', 'Oyuncu'],
    ['Pişirme', 'Restoran', 'Açlık'],
    ['Hakem', 'Futbolcu', 'Stadyum']
  ];

  int currentWordIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tabu Oyunu"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                words[currentWordIndex],
                style: TextStyle(fontSize: 48.0),
              ),
              SizedBox(height: 24.0),
              Text(
                "Tabu Kelimeler: ${tabooWords[currentWordIndex].join(', ')}",
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 24.0),
              Text(
                "Puan: $score",
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentWordIndex = Random().nextInt(words.length);
                  });
                },
                child: Text(
                  "Sonraki Kelime",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    score += 1;
                    currentWordIndex = Random().nextInt(words.length);
                  });
                },
                child: Text(
                  "Doğru",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    score -= 1;
                    currentWordIndex = Random().nextInt(words.length);
                  });
                },
                child: Text(
                  "Tabu",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
