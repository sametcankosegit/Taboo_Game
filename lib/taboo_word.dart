import 'package:flutter/material.dart';

void main() => runApp(TabooGame());

class TabooGame extends StatefulWidget {
  @override
  _TabooGameState createState() => _TabooGameState();
}

class _TabooGameState extends State<TabooGame> {
  final List<String> _words = ['Bisiklet', 'Ölüm', 'Sinema', 'Yemek', 'Futbol'];
  final List<List<String>> _tabooWords = [
    ['Teker', 'Motosiklet', 'Pedal'],
    ['Yaşam', 'Ahiret', 'Mezar'],
    ['Film', 'Yönetmen', 'Oyuncu'],
    ['Pişirme', 'Restoran', 'Açlık'],
    ['Hakem', 'Futbolcu', 'Stadyum']
  ];
  int _currentIndex = 0;
  int _points = 0;

  void _passWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  void _addPoint() {
    setState(() {
      _points++;
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  void _removePoint() {
    setState(() {
      _points--;
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffe66465), Color(0xff9198e5)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tabu Oyunu',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _words[_currentIndex],
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tabu Kelimeler:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _tabooWords[_currentIndex]
                        .map(
                          (tabooWord) => Chip(
                            label: Text(
                              tabooWord,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _passWord,
                    child: const Text('Sonraki Kelime'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Puanlar: $_points',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addPoint,
                    child: Text('Doğru'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _removePoint,
                    child: Text('Yanlış'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.antalyaspor.com.tr/Upload/File/2019/10/29/7347501827617702805089005292894013693624320n.jpg'),
                  ),
                ),
                child: null,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Ayarlar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: const Text('Hakkında'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
