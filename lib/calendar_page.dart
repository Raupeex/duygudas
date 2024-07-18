import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, String> _moods = {};

  @override
  void initState() {
    super.initState();
    _loadMoods();
  }

  void _loadMoods() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();
    Map<DateTime, String> loadedMoods = {};
    for (String key in keys) {
      try {
        DateTime date = DateTime.parse(key);
        String? mood = prefs.getString(key);
        if (mood != null) {
          loadedMoods[date] = mood;
        }
      } catch (e) {
        print('Tarih formatı hatalı: $key');
      }
    }
    setState(() {
      _moods = loadedMoods;
    });
  }

  Widget _buildEventsMarker(DateTime date) {
    if (_moods[date] != null) {
      IconData iconData;
      Color iconColor;
      switch (_moods[date]) {
        case 'Very Good':
          iconData = Icons.sentiment_very_satisfied;
          iconColor = Colors.green.shade800;
          break;
        case 'Good':
          iconData = Icons.sentiment_satisfied;
          iconColor = Colors.green.shade400;
          break;
        case 'Neutral':
          iconData = Icons.sentiment_neutral;
          iconColor = Colors.yellow;
          break;
        case 'Bad':
          iconData = Icons.sentiment_dissatisfied;
          iconColor = Colors.orange;
          break;
        case 'Very Bad':
          iconData = Icons.sentiment_very_dissatisfied;
          iconColor = Colors.red;
          break;
        default:
          iconData = Icons.sentiment_satisfied;
          iconColor = Colors.blue;
      }
      return Positioned(
        bottom: 1,
        child: Icon(
          iconData,
          size: 20.0,
          color: iconColor,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takvim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              return _buildEventsMarker(date);
            },
          ),
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
        currentIndex: 2, // Takvim sayfasında olduğumuz için index 2
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            // Sohbet sayfası
            // Navigator.pushReplacementNamed(context, '/chat'); // Henüz tanımlı değil
          } else if (index == 1) {
            // Günlük sayfası
            // Navigator.pushReplacementNamed(context, '/diary'); // Henüz tanımlı değil
          } else if (index == 2) {
            // Takvim sayfası
            Navigator.pushReplacementNamed(context, '/calendar');
          }
        },
      ),
    );
  }
}
