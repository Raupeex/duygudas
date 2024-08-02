import 'package:flutter/material.dart';

import '../main.dart'; // Global listeyi kullanmak için import ediyoruz

class TestResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Test Sonuçlarım',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF50E5CA),
              fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFF0F8FF),
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
        selectedItemColor: Color.fromARGB(255, 113, 113, 113),
        onTap: (int index) {
          // Henüz sayfalar oluşturulmadı, fonksiyonlar boş kalacak
        },
      ),
    );
  }
}
