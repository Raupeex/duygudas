import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        backgroundColor: Color(0xFFF0F8FF),
      ),
      backgroundColor: Color(0xFFF0F8FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Mail Adresi',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDFD8D8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Şifre',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;

                try {
                  await auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  Fluttertoast.showToast(msg: 'Giriş Başarılı');
                  Navigator.pushReplacementNamed(context, '/mood');
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: 'Hatalı kullanıcı adı veya şifre');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF36DCD9),
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
              ),
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}