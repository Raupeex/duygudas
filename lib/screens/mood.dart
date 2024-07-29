import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodSelectorPage extends StatefulWidget {
  @override
  _MoodSelectorPageState createState() => _MoodSelectorPageState();
}

class _MoodSelectorPageState extends State<MoodSelectorPage> {
  final List<Mood> moods = [
    Mood(
        icon: Icons.sentiment_very_satisfied,
        text: 'Very Good',
        color: Colors.green.shade800),
    Mood(
        icon: Icons.sentiment_satisfied,
        text: 'Good',
        color: Colors.green.shade400),
    Mood(icon: Icons.sentiment_neutral, text: 'Neutral', color: Colors.yellow),
    Mood(icon: Icons.sentiment_dissatisfied, text: 'Bad', color: Colors.orange),
    Mood(
        icon: Icons.sentiment_very_dissatisfied,
        text: 'Very Bad',
        color: Colors.red),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        Navigator.pushReplacementNamed(context, '/calendar');
      }
    });
  }

  void _saveMood(String mood) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime today = DateTime.now();
    String todayStr = "${today.year}-${today.month}-${today.day}";
    await prefs.setString(todayStr, mood);
    Navigator.pushReplacementNamed(
        context, '/calendar'); // Takvim sayfasını yenileyin
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Mood'),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: moods.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${moods[index].text}')),
                );
                _saveMood(moods[index].text);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: moods[index].color,
                ),
                width: double.infinity,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      moods[index].icon,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      moods[index].text,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
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
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Mood {
  final IconData icon;
  final String text;
  final Color color;

  Mood({required this.icon, required this.text, required this.color});
}
