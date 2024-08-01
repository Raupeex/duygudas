import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String userAvatar = 'assets/images/fox.png';

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
    _loadAvatar();
  }

  Future<void> _saveAvatar(String avatarPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_avatar', avatarPath);
    setState(() {
      userAvatar = avatarPath;
    });
  }

  Future<void> _loadAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userAvatar = prefs.getString('user_avatar') ?? 'assets/images/fox.png';
    });
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
                  padding:
                      const EdgeInsets.all(16.0), // Padding değerini artırdık
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
        title: Text('Ana Sayfa'),
        leading: PopupMenuButton<String>(
          icon: CircleAvatar(
            backgroundImage: AssetImage(userAvatar),
          ),
          onSelected: (String result) {
            if (result == 'Avatarı Değiştir') {
              _showAvatarOptions(context);
            } else if (result == 'Test Sonuçlarım') {
              Navigator.pushNamed(context, '/test_results');
            } else if (result == 'Profilimi Düzenle') {
              Navigator.pushNamed(context, '/edit_profile');
            } else if (result == 'Hesabı Kapat') {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login_register', (route) => false);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Avatarı Değiştir',
              child: Text('Avatarı Değiştir'),
            ),
            const PopupMenuItem<String>(
              value: 'Test Sonuçlarım',
              child: Text('Test Sonuçlarım'),
            ),
            const PopupMenuItem<String>(
              value: 'Profilimi Düzenle',
              child: Text('Profilimi Düzenle'),
            ),
            const PopupMenuItem<String>(
              value: 'Hesabı Kapat',
              child: Text('Hesabı Kapat'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/breathing_exercises');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Nefes Egzersizleri'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/relaxation_exercises');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Gevşeme Egzersizleri'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tests');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Testler'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/professional_support');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Profesyonel destek al'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login_register', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Çıkış'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/personal_information');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Kişisel Bilgilerim'),
              ),
            ),
          ],
        ),
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
        onTap: (int index) {
          // Henüz sayfalar oluşturulmadı, fonksiyonlar boş kalacak
        },
      ),
    );
  }
}
