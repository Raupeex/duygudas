import 'package:flutter/material.dart';

import '../main.dart'; // Global listeyi kullanmak için import ediyoruz

class TestResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Sonuçları'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: testResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(testResults[index]),
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
    );
  }
}
