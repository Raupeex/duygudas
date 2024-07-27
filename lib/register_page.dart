import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'main.dart'; // Global değişkenleri kullanmak için import ediyoruz

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController tcController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ol'),
        backgroundColor: Color(0xFFF0F8FF),
      ),
      backgroundColor: Color(0xFFF0F8FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Ad Soyad',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: surnameController,
                decoration: const InputDecoration(
                  labelText: 'Soyad',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nicknameController,
                decoration: const InputDecoration(
                  labelText: 'Rumuz',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: tcController,
                decoration: const InputDecoration(
                  labelText: 'TC Kimlik Numarası',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Doğum Tarihi',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefon',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Mail Adresi',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: diagnosisController,
                decoration: const InputDecoration(
                  labelText: 'Psikolojik rahatsızlık tanıları',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: medicationController,
                decoration: const InputDecoration(
                  labelText: 'Kullanılan psikiyatri ilaçları',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  userName = nameController.text;
                  userSurname = surnameController.text;
                  userNickname = nicknameController.text;
                  userPhone = phoneController.text;
                  userEmail = emailController.text;
                  userDiagnosis = diagnosisController.text;
                  userMedications = medicationController.text;

                  Fluttertoast.showToast(msg: 'Kayıt başarılı');
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login_register', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8AFAA4),
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                ),
                child: const Text('Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
