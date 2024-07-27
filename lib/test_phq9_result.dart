import 'package:flutter/material.dart';

import 'main.dart'; // Global listeyi kullanmak için import ediyoruz

class TestPHQ9ResultPage extends StatelessWidget {
  final int score;

  TestPHQ9ResultPage({required this.score}) {
    // Test sonucunu global listeye ekleyelim
    String resultMessage = _getResultMessage();
    testResults.add('PHQ-9 Test Sonucu: $score - $resultMessage');
  }

  String _getResultMessage() {
    if (score <= 4) {
      return 'Minimal depresyon';
    } else if (score <= 9) {
      return 'Hafif depresyon';
    } else if (score <= 14) {
      return 'Orta dereceli depresyon';
    } else if (score <= 19) {
      return 'Orta-ağır depresyon';
    } else {
      return 'Ağır depresyon';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PHQ-9 Test Sonucu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/tests'));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Puanınız: $score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _getResultMessage(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
