import 'package:flutter/material.dart';

import 'main.dart'; // Global değişkenleri kullanmak için import ediyoruz

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

  @override
  void initState() {
    super.initState();
    _nameController.text = userName;
    _surnameController.text = userSurname;
    _nicknameController.text = userNickname;
    _phoneController.text = userPhone;
    _emailController.text = userEmail;
    _diagnosisController.text = userDiagnosis;
    _medicationsController.text = userMedications;
  }

  void _saveProfile() {
    setState(() {
      userName = _nameController.text;
      userSurname = _surnameController.text;
      userNickname = _nicknameController.text;
      userPhone = _phoneController.text;
      userEmail = _emailController.text;
      userDiagnosis = _diagnosisController.text;
      userMedications = _medicationsController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profil başarıyla güncellendi'),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/main_page', (route) => false);
    });
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
              decoration: InputDecoration(labelText: 'Mail'),
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
