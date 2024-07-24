import 'dart:async';

import 'package:flutter/material.dart';

class FourFourFourBreathPage extends StatefulWidget {
  @override
  _FourFourFourBreathPageState createState() => _FourFourFourBreathPageState();
}

class _FourFourFourBreathPageState extends State<FourFourFourBreathPage> {
  Timer? _timer;
  int _counter = 4;
  int _phase = 0;
  bool _isRunning = false;
  String _displayText = 'Başlat';
  String _phaseText = '';

  void _startTimer() {
    if (mounted) {
      setState(() {
        _isRunning = true;
        _displayText = 'Durdur';
        _phaseText = 'Nefes Al';
        _counter = 4;
      });

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            if (_counter > 1) {
              _counter--;
            } else {
              _counter = 4;
              _phase = (_phase + 1) % 3;
              if (_phase == 0) {
                _phaseText = 'Nefes Al';
              } else if (_phase == 1) {
                _phaseText = 'Nefesini Tut';
              } else if (_phase == 2) {
                _phaseText = 'Nefes Ver';
              }
            }
          });
        } else {
          timer.cancel();
        }
      });
    }
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    if (mounted) {
      setState(() {
        _isRunning = false;
        _displayText = 'Başlat';
        _phaseText = '';
      });
    }
  }

  void _toggleTimer() {
    if (_isRunning) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    super.dispose();
  }

  void _onBackPressed() {
    _stopTimer(); // Timer'ı durdur
    Navigator.pop(context); // Sayfayı kapat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4X4X4 Nefes Egzersizi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:
              _onBackPressed, // Geri düğmesine tıklanınca çalışacak fonksiyon
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _phaseText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleTimer,
              child: Text(_displayText),
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
