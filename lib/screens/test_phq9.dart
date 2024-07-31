import 'package:flutter/material.dart';

import 'test_phq9_result.dart';

class TestPHQ9Page extends StatefulWidget {
  @override
  _TestPHQ9PageState createState() => _TestPHQ9PageState();
}

class _TestPHQ9PageState extends State<TestPHQ9Page> {
  final List<int> _answers = List<int>.filled(9, 0);

  final List<String> _questions = [
    '1. İlgi veya zevk kaybı',
    '2. Depresif, moral bozukluğu ya da umutsuz hissetme',
    '3. Uyku sorunları (uyuyamama ya da fazla uyuma)',
    '4. Yorgunluk ya da enerjisizlik',
    '5. İştah değişiklikleri (iştah kaybı ya da aşırı yeme)',
    '6. Kendini değersiz hissetme ya da suçluluk duyguları',
    '7. Düşünme, konsantre olma ya da karar verme sorunları',
    '8. Hareketlerde ya da konuşmada yavaşlama ya da huzursuzluk',
    '9. Kendine zarar verme ya da ölümü düşünme',
  ];

  final List<String> _options = [
    'Hiç',
    'Birkaç gün',
    'Günlerin yarısından fazlası',
    'Neredeyse her gün'
  ];

  void _submitTest() {
    int totalScore = _answers.reduce((a, b) => a + b);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestPHQ9ResultPage(score: totalScore),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PHQ-9 Testi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _questions[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: _options.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String option = entry.value;
                    return RadioListTile<int>(
                      title: Text(option),
                      value: idx,
                      groupValue: _answers[index],
                      onChanged: (value) {
                        setState(() {
                          _answers[index] = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Sohbet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Günlük',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Takvim',
          ),
        ],
        onTap: (int index) {
          // Henüz sayfalar oluşturulmadı, fonksiyonlar boş kalacak
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitTest,
        child: Icon(Icons.check),
      ),
    );
  }
}
