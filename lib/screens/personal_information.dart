import 'package:flutter/material.dart';

import '../models/user.dart' as app_model;
import '../services/user_service.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Kişisel Bilgilerim',
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
      body: FutureBuilder<app_model.User>(
        future: userService.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Kullanıcı verisi bulunamadı'));
          } else {
            app_model.User user = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage(user.avatar), // Kullanıcı avatarı
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ad: ${user.name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Soyad: ${user.surname}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Rumuz: ${user.nickname}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Telefon Numarası: ${user.phone}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Mail: ${user.email}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Psikolojik rahatsızlık tanıları: ${user.diagnosis}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Kullanılan psikiyatri ilaçları: ${user.medications}',
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
            );
          }
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
