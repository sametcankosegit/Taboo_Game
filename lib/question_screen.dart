import 'package:flutter/material.dart';
import 'package:tabu_game/taboo_game.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'Kelimeler güzel ve doğru mu?',
      'options': [
        'Güzel ve hata yok',
        'Güzel ama ufak düzenleme gerek',
        'Tamamen baştan düzeltmek gerek',
        'Uygulamayı siliyorum'
      ]
    },
    {
      'question':
          'Uygulamamızı beğendiniz mi? Beğenmediğiz yerleri bize bildirin.',
      'options': [
        'Beğendim',
        'Emin Değilim',
        'Beğenmedim',
        'Geliştirilmesi Gerek'
      ]
    },
  ];

  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3366FF),
            Color(0xFF00CCFF),
            Color(0xFF99FF33),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SORULAR'),
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < _questions.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _questions[i]['question'],
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 8.0),
                      for (var j = 0; j < _questions[i]['options'].length; j++)
                        RadioListTile(
                          title: Text(_questions[i]['options'][j]),
                          value: _questions[i]['options'][j],
                          groupValue: i == 0
                              ? _selectedOption1
                              : i == 1
                                  ? _selectedOption2
                                  : _selectedOption3,
                          onChanged: (value) {
                            setState(() {
                              if (i == 0) {
                                _selectedOption1 = value as String?;
                              } else if (i == 1) {
                                _selectedOption2 = value as String?;
                              } else {
                                _selectedOption3 = value as String?;
                              }
                            });
                          },
                        ),
                      Divider(),
                    ],
                  ),
                ElevatedButton(
                  child: const Text('Gönder'),
                  onPressed: _selectedOption1 == null ||
                          _selectedOption2 == null ||
                          _selectedOption3 == null
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Doğrulama'),
                                content: const Text(
                                    'Cevabınızı göndermek istediğinize emin misiniz?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('İptal'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Gönder'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TabooGame()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
