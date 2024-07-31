import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    User? user = auth.currentUser;
    if (user != null) {
      firestore
          .collection('users')
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          var data = documentSnapshot.data() as Map<String, dynamic>;
          setState(() {
            _nameController.text = data['name'] ?? '';
            _surnameController.text = data['surname'] ?? '';
            _nicknameController.text = data['nickname'] ?? '';
            _phoneController.text = data['phone'] ?? '';
            _emailController.text = data['email'] ?? '';
            _diagnosisController.text = data['diagnosis'] ?? '';
            _medicationsController.text = data['medications'] ?? '';
          });
        }
      });
    }
  }

  void _saveProfile() async {
    String name = _nameController.text;
    String surname = _surnameController.text;
    String nickname = _nicknameController.text;
    String phone = _phoneController.text;
    String diagnosis = _diagnosisController.text;
    String medications = _medicationsController.text;

    // Validation
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Ad alanı boş bırakılamaz.');
      return;
    }

    if (surname.isEmpty) {
      Fluttertoast.showToast(msg: 'Soyad alanı boş bırakılamaz.');
      return;
    }

    if (nickname.isEmpty || nickname.length < 3) {
      Fluttertoast.showToast(msg: 'Rumuz en az 3 karakter olmalıdır.');
      return;
    }

    // Telefon numarası doğrulaması (05 ile başlamalı)
    if (!phone.startsWith('05') ||
        !RegExp(r'^\d+$').hasMatch(phone) ||
        phone.length != 10) {
      Fluttertoast.showToast(msg: 'Lütfen geçerli bir telefon numarası girin.');
      return;
    }

    try {
      User? user = auth.currentUser;
      if (user != null) {
        await firestore.collection('users').doc(user.uid).update({
          'name': name,
          'surname': surname,
          'nickname': nickname,
          'phone': phone,
          'diagnosis': diagnosis,
          'medications': medications,
        });
        Fluttertoast.showToast(msg: 'Profil başarıyla güncellendi');
        Navigator.pushNamedAndRemoveUntil(
            context, '/main_page', (route) => false);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Profil güncelleme hatası: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Düzenle'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Soyad'),
            ),
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(labelText: 'Rumuz'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Telefon'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Mail',
                enabled: false, // E-posta alanını düzenlenemez yapar
              ),
            ),
            TextField(
              controller: _diagnosisController,
              decoration:
                  InputDecoration(labelText: 'Psikolojik rahatsızlık tanıları'),
            ),
            TextField(
              controller: _medicationsController,
              decoration:
                  InputDecoration(labelText: 'Kullanılan psikiyatri ilaçları'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
