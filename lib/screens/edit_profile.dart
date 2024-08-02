import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/shared_preferences_util.dart';

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

  String _selectedAvatar = 'assets/images/fox.png';

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static const List<String> avatarPaths = [
    'assets/images/bear.png',
    'assets/images/cat.png',
    'assets/images/chicken.png',
    'assets/images/dog.png',
    'assets/images/fox.png',
    'assets/images/meerkat.png',
    'assets/images/panda.png',
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadAvatar();
  }

  Future<void> _loadAvatar() async {
    final avatar = await SharedPreferencesUtil.getAvatar();
    setState(() {
      _selectedAvatar = avatar;
    });
  }

  Future<void> _saveAvatar(String avatar) async {
    await SharedPreferencesUtil.saveAvatar(avatar);
    setState(() {
      _selectedAvatar = avatar;
    });
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
        phone.length != 11) {
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

  void _showAvatarOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: GridView.builder(
            itemCount: avatarPaths.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  await _saveAvatar(avatarPaths[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(avatarPaths[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Profil Düzenle',
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
      backgroundColor: Color(0xFFF0F8FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(_selectedAvatar),
                  ),
                  SizedBox(height: 20),
                  Text('Avatarınızı seçin:'),
                  Wrap(
                    spacing: 10,
                    children: avatarPaths.map((avatarPath) {
                      return GestureDetector(
                        onTap: () => _saveAvatar(avatarPath),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(avatarPath),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
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
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (!value.startsWith('05')) {
                  _phoneController.text = '05';
                  _phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _phoneController.text.length),
                  );
                }
              },
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF36DCD9),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
