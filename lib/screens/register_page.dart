import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController tcController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController =
      TextEditingController(text: '05');
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
                  labelText: 'Ad',
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
                keyboardType: TextInputType.number,
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
                  String newText = value;
                  // Doğum tarihi alanında / karakterlerini doğru yerlerde tutma
                  if (value.length > 10) {
                    newText = value.substring(0, 10);
                  }
                  if (value.length == 2 || value.length == 5) {
                    if (!value.endsWith('/')) {
                      newText = value + '/';
                    }
                  }
                  if (value.length == 3 && value[2] != '/') {
                    newText = value.substring(0, 2) + '/' + value.substring(2);
                  } else if (value.length == 6 && value[5] != '/') {
                    newText = value.substring(0, 5) + '/' + value.substring(5);
                  }
                  dobController.value = TextEditingValue(
                    text: newText,
                    selection: TextSelection.fromPosition(
                      TextPosition(offset: newText.length),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefon (05...)',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDFD8D8)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (!value.startsWith('05')) {
                    phoneController.text = '05';
                    phoneController.selection = TextSelection.fromPosition(
                      TextPosition(offset: phoneController.text.length),
                    );
                  }
                },
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
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: diagnosisController,
                decoration: const InputDecoration(
                  labelText: 'Psikolojik Rahatsızlık Tanıları',
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
                  labelText: 'Kullanılan Psikiyatri İlaçları',
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
                  String surname = surnameController.text;
                  String nickname = nicknameController.text;
                  String tc = tcController.text;
                  String dob = dobController.text;
                  String phone = phoneController.text;
                  String email = emailController.text;
                  String diagnosis = diagnosisController.text;
                  String medication = medicationController.text;
                  String password = passwordController.text;

                  // Validations
                  if (name.isEmpty) {
                    Fluttertoast.showToast(msg: 'Ad alanı boş bırakılamaz.');
                    return;
                  }

                  if (surname.isEmpty) {
                    Fluttertoast.showToast(msg: 'Soyad alanı boş bırakılamaz.');
                    return;
                  }

                  if (nickname.isEmpty || nickname.length < 3) {
                    Fluttertoast.showToast(
                        msg: 'Rumuz en az 3 karakter olmalıdır.');
                    return;
                  }

                  // Doğum tarihi doğrulaması (DD/MM/YYYY formatında ve bugünden önce olmalı)
                  if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dob)) {
                    Fluttertoast.showToast(
                        msg:
                            'Lütfen geçerli bir doğum tarihi girin (DD/MM/YYYY).');
                    return;
                  }
                  DateTime birthDate = DateTime.parse(
                      '${dob.substring(6)}-${dob.substring(3, 5)}-${dob.substring(0, 2)}');
                  if (birthDate.isAfter(DateTime.now())) {
                    Fluttertoast.showToast(
                        msg: 'Doğum tarihi bugünden önce olmalıdır.');
                    return;
                  }

                  // Telefon numarası doğrulaması (05 ile başlamalı)
                  if (!phone.startsWith('05') ||
                      !RegExp(r'^\d+$').hasMatch(phone) ||
                      phone.length != 11) {
                    Fluttertoast.showToast(
                        msg: 'Lütfen geçerli bir telefon numarası girin.');
                    return;
                  }

                  // E-posta adresi doğrulaması (belirtilen domainlerle sınırlı)
                  if (!RegExp(
                          r'^[^@]+@(gmail\.com|hotmail\.com|icloud\.com|outlook\.com)$')
                      .hasMatch(email)) {
                    Fluttertoast.showToast(
                        msg: 'Lütfen geçerli bir e-posta adresi girin.');
                    return;
                  }

                  if (tc.isEmpty || tc.length != 11) {
                    Fluttertoast.showToast(
                        msg: 'TC Kimlik Numarası 11 haneli olmalıdır.');
                    return;
                  }

                  // Şifre doğrulaması (en az 6 karakter, 1 harf ve 1 rakam içermeli)
                  if (password.isEmpty ||
                      password.length < 6 ||
                      !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]')
                          .hasMatch(password)) {
                    Fluttertoast.showToast(
                        msg:
                            'Şifre en az 6 karakter, 1 harf ve 1 rakam içermelidir.');
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
                        'surname': surname,
                        'nickname': nickname,
                        'tc': tc,
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
