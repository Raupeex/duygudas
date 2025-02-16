import 'package:flutter/material.dart';

class ProfessionalSupportPage extends StatelessWidget {
  final List<Map<String, String>> psychologists = [
    {'name': 'Psk. Ayşe Harman', 'image': 'assets/images/psychologist2.jpg'},
    {'name': 'Psk. Mehmet Kaya', 'image': 'assets/images/psychologist1.jpg'},
    {'name': 'Psk. Fatma Yılmaz', 'image': 'assets/images/psychologist4.jpg'},
    {'name': 'Psk. Ahmet Demir', 'image': 'assets/images/psychologist3.jpg'},
    {'name': 'Psk. Zeynep Şahin', 'image': 'assets/images/psychologist6.jpg'},
    {'name': 'Psk. Hasan Çelik', 'image': 'assets/images/psychologist5.jpg'},
    {'name': 'Psk. Elif Arslan', 'image': 'assets/images/psychologist8.jpg'},
    {'name': 'Psk. Ali Güneş', 'image': 'assets/images/psychologist7.jpg'},
    {'name': 'Psk. Merve Aksoy', 'image': 'assets/images/psychologist10.jpg'},
    {
      'name': 'Psk. Hüseyin Yıldırım',
      'image': 'assets/images/psychologist9.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Profesyonel Destek',
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
      body: ListView.builder(
        itemCount: psychologists.length,
        itemBuilder: (context, index) {
          final psychologist = psychologists[index];
          return Card(
            child: Container(
              color: Color.fromARGB(255, 196, 243, 234),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(psychologist['image']!),
                  radius: 25, // İsteğe bağlı olarak boyut ayarlanabilir
                ),
                title: Text(psychologist['name']!),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: Colors.grey),
                  onPressed: () {
                    print('WhatsApp icon clicked for ${psychologist['name']}');
                  },
                ),
              ),
            ),
          );
        },
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
}
