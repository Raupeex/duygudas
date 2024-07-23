import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.person),
          onSelected: (String result) {
            if (result == 'Ayarlar') {
              Navigator.pushNamed(context, '/settings');
            } else if (result == 'Profilimi Düzenle') {
              Navigator.pushNamed(context, '/profile_edit');
            } else if (result == 'Hesabı Kapat') {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login_register', (route) => false);
            } else if (result == 'Test Sonuçlarım') {
              Navigator.pushNamed(context, '/test_results');
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Ayarlar',
              child: Text('Ayarlar'),
            ),
            const PopupMenuItem<String>(
              value: 'Profilimi Düzenle',
              child: Text('Profilimi Düzenle'),
            ),
            const PopupMenuItem<String>(
              value: 'Test Sonuçlarım',
              child: Text('Test Sonuçlarım'),
            ),
            const PopupMenuItem<String>(
              value: 'Hesabı Kapat',
              child: Text('Hesabı Kapat'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/breathing_exercises');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Nefes Egzersizleri'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/relaxation_exercises');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Gevşeme Egzersizleri'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tests');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Testler'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/professional_support');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Profesyonel destek al'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login_register', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Çıkış'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Kişisel bilgilerim'),
              ),
            ),
          ],
        ),
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
