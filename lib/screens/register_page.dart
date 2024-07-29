import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Doğum Tarihi (DD/MM/YYYY)',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  if (value.length == 2 || value.length == 5) {
                    dobController.text = '$value/';
                    dobController.selection = TextSelection.fromPosition(
                      TextPosition(offset: dobController.text.length),
                    );
                  } else if (value.length > 10) {
                    dobController.text = value.substring(0, 10);
                    Fluttertoast.showToast(
                        msg: 'Geçersiz tarih formatı. DD/MM/YYYY olmalı.');
                  }
                },
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  String name = nameController.text;
                  String nickname = nicknameController.text;
                  String dob = dobController.text;
                  String phone = phoneController.text;
                  String email = emailController.text;
                  String diagnosis = diagnosisController.text;
                  String medication = medicationController.text;
                  String password = passwordController.text;

                  // Validations
                  if (name.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Ad Soyad alanı boş bırakılamaz.');
                    return;
                  }

                  if (nickname.isEmpty || nickname.length < 3) {
                    Fluttertoast.showToast(
                        msg: 'Rumuz en az 3 karakter olmalıdır.');
                    return;
                  }

                  if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dob)) {
                    Fluttertoast.showToast(
                        msg:
                            'Lütfen geçerli bir doğum tarihi girin (DD/MM/YYYY).');
                    return;
                  }

                  if (!RegExp(r'^\d+$').hasMatch(phone) || phone.length < 10) {
                    Fluttertoast.showToast(
                        msg: 'Lütfen geçerli bir telefon numarası girin.');
                    return;
                  }

                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                    Fluttertoast.showToast(
                        msg: 'Lütfen geçerli bir e-posta adresi girin.');
                    return;
                  }

                  if (password.isEmpty || password.length < 6) {
                    Fluttertoast.showToast(
                        msg: 'Şifre en az 6 karakter olmalıdır.');
                    return;
                  }

                  try {
                    // Firebase Authentication ile kullanıcı oluşturma
                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    // Kullanıcıyı başarılı bir şekilde oluşturduktan sonra Firestore'a kaydetme
                    User? user = userCredential.user;
                    if (user != null) {
                      await firestore.collection('users').doc(user.uid).set({
                        'name': name,
                        'nickname': nickname,
                        'dob': dob,
                        'phone': phone,
                        'email': email,
                        'diagnosis': diagnosis,
                        'medication': medication,
                      });

                      Fluttertoast.showToast(msg: 'Kayıt başarılı');
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(msg: 'Kullanıcı oluşturulamadı.');
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(
                          msg: 'Bu e-posta adresi zaten kullanımda.');
                    } else if (e.code == 'weak-password') {
                      Fluttertoast.showToast(
                          msg:
                              'Zayıf şifre. Lütfen daha güçlü bir şifre kullanın.');
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Kayıt başarısız: ${e.message}');
                    }
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'Kayıt başarısız: ${e.toString()}');
                  }
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
