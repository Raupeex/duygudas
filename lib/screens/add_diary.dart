import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'diary_days_list.dart';

class AddDiaryPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  Future<void> _saveDiary(String text) async {
    final prefs = await SharedPreferences.getInstance();
    final DateTime now = DateTime.now();
    final String formattedDate = "${now.day}-${now.month}-${now.year}";
    final Map<String, String> diaryEntry = {
      'date': formattedDate,
      'text': text
    };

    List<String> diaryList = prefs.getStringList('diaryList') ?? [];
    diaryList.add(jsonEncode(diaryEntry));
    await prefs.setStringList('diaryList', diaryList);

    // Debugging için: Eklenen öğeleri yazdır
    print('Kaydedilen günlükler: $diaryList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Günlüğüm',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF50E5CA),
              fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DiaryDaysList()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Merhaba! Bugününden bahsetmek ister misin?',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  await _saveDiary(_controller.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DiaryDaysList()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      Color(0xFF36DCD9) // Butonun metin rengini değiştirir
                  ),
              child: Text('Kaydet'),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                // Ses kaydı işlemi burada yapılacak (şimdilik aktif değil)
                print('Ses kaydı ikonu tıklandı');
              },
            ),
          ],
        ),
      ),
    );
  }
}
