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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Sayfalar henüz oluşturulmadı, burası boş bırakılabilir
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: const Text(
          'Duygudaş',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF50E5CA),
              fontSize: 28),
        ),
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
            PopupMenuItem<String>(
              value: 'Avatarı Değiştir',
              child: Container(
                color: Colors.blueGrey[50], // Background color
                child: Text(
                  'Avatarı Değiştir',
                  style: TextStyle(
                    color: Color(0xFF36DCD9),
                  ), // Text color
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Test Sonuçlarım',
              child: Container(
                color: Colors.blueGrey[50], // Background color
                child: Text(
                  'Test Sonuçlarım',
                  style: TextStyle(
                    color: Color(0xFF36DCD9),
                  ), // Text color
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Profilimi Düzenle',
              child: Container(
                color: Colors.blueGrey[50], // Background color
                child: Text(
                  'Profilimi Düzenle',
                  style: TextStyle(
                    color: Color(0xFF36DCD9),
                  ), // Text color
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Hesabı Kapat',
              child: Container(
                color: Colors.blueGrey[50], // Background color
                child: Text(
                  'Hesabı Kapat',
                  style: TextStyle(
                    color: Color(0xFF36DCD9),
                  ), // Text color
                ),
              ),
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
                child: Text(
                  'Nefes Egzersizleri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF36DCD9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
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
                child: Text(
                  'Gevşeme Egzersizleri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF36DCD9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
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
                child: Text(
                  'Testler',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF36DCD9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
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
                child: Text(
                  'Profesyonel Destek',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF36DCD9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
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
                child: Text(
                  'Çıkış',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF36DCD9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
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
                child: Text(
                  'Kişisel Bilgilerim',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF36DCD9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
