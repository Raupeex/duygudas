import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class LoginRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoşgeldiniz'),
        backgroundColor: Color(0xFFF0F8FF),
      ),
      backgroundColor: Color(0xFFF0F8FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/logog.png',
                width: 170.0,
                height: 170.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF36DCD9),
                foregroundColor: Colors.black,
              ),
              child: const Text('Giriş Yap'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8AFAA4),
                foregroundColor: Colors.black,
              ),
              child: const Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }
}
