import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_nav_bar.dart';
import 'add_diary.dart';
import 'calendar_page.dart';
import 'chat_page.dart';
import 'diary_detail_page.dart';
import 'main_page.dart';

class DiaryDaysList extends StatefulWidget {
  @override
  _DiaryDaysListState createState() => _DiaryDaysListState();
}

class _DiaryDaysListState extends State<DiaryDaysList> {
  int _selectedIndex = 1;
  List<Map<String, String>> _diaryList = [];

  @override
  void initState() {
    super.initState();
    _loadDiaries();
  }

  Future<void> _loadDiaries() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> diaryList = prefs.getStringList('diaryList') ?? [];
    setState(() {
      _diaryList = diaryList
          .map((e) => Map<String, String>.from(jsonDecode(e)))
          .toList();
    });

    // Debugging için: Yüklenen öğeleri yazdır
    print('Yüklenen günlükler: $_diaryList');
  }

  Future<void> _deleteDiary(int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> diaryList = prefs.getStringList('diaryList') ?? [];
    diaryList.removeAt(index);
    await prefs.setStringList('diaryList', diaryList);
    setState(() {
      _diaryList.removeAt(index);
    });

    // Debugging için: Kalan öğeleri yazdır
    print('Kalan günlükler: $_diaryList');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DiaryDaysList()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CalendarPage()),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0F8FF),
          title: Text(
            'Günlük Sayfası',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF50E5CA),
                fontSize: 22),
          ),
        ),
        backgroundColor: Color(0xFFF0F8FF),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: _diaryList.length,
              itemBuilder: (context, index) {
                final diary = _diaryList[index];
                return ListTile(
                  title: Text(diary['date'] ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiaryDetailPage(diary: diary),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete,
                        color: Color.fromARGB(255, 51, 58, 57)),
                    onPressed: () {
                      _deleteDiary(index);
                    },
                  ),
                );
              },
            ),
            Positioned(
              bottom:
                  70, // BottomNavigationBar'ın üzerinde olacak şekilde konumlandırma
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDiaryPage()),
                  );
                },
                backgroundColor: Color(0xFF36DCD9),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
