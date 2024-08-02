import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/shared_preferences_util.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Duygudaş',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF50E5CA),
              fontSize: 28),
        ),
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
                labelStyle:
                    TextStyle(color: Color.fromARGB(255, 203, 203, 203)),
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
                labelStyle:
                    TextStyle(color: Color.fromARGB(255, 203, 203, 203)),
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
                  UserCredential userCredential =
                      await auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  final user = userCredential.user;
                  if (user != null) {
                    await SharedPreferencesUtil.saveUserName(
                        user.displayName ?? 'Ad Yok');
                    await SharedPreferencesUtil.saveUserEmail(
                        user.email ?? 'Email Yok');
                    final token = await user.getIdToken();
                    if (token != null) {
                      await SharedPreferencesUtil.saveUserToken(token);
                    }
                    Fluttertoast.showToast(msg: 'Giriş Başarılı');
                    Navigator.pushReplacementNamed(context, '/main_page');
                  } else {
                    Fluttertoast.showToast(msg: 'Giriş başarısız');
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Fluttertoast.showToast(
                        msg:
                            'Bu e-posta adresi ile kayıtlı bir kullanıcı bulunamadı.');
                  } else if (e.code == 'wrong-password') {
                    Fluttertoast.showToast(msg: 'Hatalı şifre.');
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Giriş başarısız: ${e.message}');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF36DCD9),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
