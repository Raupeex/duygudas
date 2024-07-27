import 'package:flutter/material.dart';

import 'main.dart'; // Global değişkenleri kullanmak için import ediyoruz

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişisel Bilgilerim'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(userAvatar), // Kullanıcı avatarı
            ),
            SizedBox(height: 20),
            Text(
              'Ad: $userName',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Soyad: $userSurname',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Rumuz: $userNickname',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Telefon Numarası: $userPhone',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Mail: $userEmail',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Psikolojik rahatsızlık tanıları: $userDiagnosis',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Kullanılan psikiyatri ilaçları: $userMedications',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
              child: Text('Profil Düzenle'),
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
