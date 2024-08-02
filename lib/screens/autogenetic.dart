import 'package:flutter/material.dart';

class AutogeneticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Otojenik Gevşeme',
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildInstructionContainer(
              '1. Ağırlık Hissi',
              '\nRahatça otur veya uzan.\nGözlerini kapat, derin nefes al.\n“Kolum ağırlaşıyor.” diye tekrarla.\n\nBu egzersiz seni gevşetir ve stresini azaltır.',
            ),
            _buildInstructionContainer(
              '2. Sıcaklık Hissi',
              '\nRahatça otur veya uzan.\nGözlerini kapat, derin nefes al.\n“Kolum ısınıyor.” diye tekrarla.\n\nBu egzersiz kan dolaşımını artırır ve kaslarını gevşetir.',
            ),
            _buildInstructionContainer(
              '3. Kalp Atış Hızı Hissi',
              '\nRahatça otur veya uzan.\nGözlerini kapat, derin nefes al.\n“Kalp atışlarım sakin.” diye tekrarla.\n\nBu egzersiz kalp hızını düzenler ve stresini azaltır.',
            ),
            _buildInstructionContainer(
              '4. Nefes Alma ve Verme Hissi',
              '\nRahatça otur veya uzan.\nGözlerini kapat, derin nefes al.\n“Nefesim düzenli.” diye tekrarla.\n\nBu egzersiz nefes düzenini sağlar ve seni rahatlatır.',
            ),
            _buildInstructionContainer(
              '5. Karın Bölgesi Hissi',
              '\nRahatça otur veya uzan.\nGözlerini kapat, derin nefes al.\n“Karın bölgem genişliyor.” diye tekrarla.\n\n Bu egzersiz sindirimini rahatlatır ve stresini azaltır.',
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
        selectedItemColor: Color.fromARGB(255, 113, 113, 113),
        onTap: (int index) {
          // Henüz sayfalar oluşturulmadı, fonksiyonlar boş kalacak
        },
      ),
    );
  }

  Widget _buildInstructionContainer(String title, String description) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
