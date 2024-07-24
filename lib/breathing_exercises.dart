import 'package:flutter/material.dart';

class BreathingExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nefes Egzersizleri'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            _buildExerciseContainer(
              context,
              '4X4X4 Nefes Egzersizi',
              'Sakinleşmeni ve kalp atışını düşürmeni sağlar. Özellikle tüm vücut gevşeme çalışmaları veya güvenli alan çalışmalarından önce kullanarak stresini azaltabilirsin.',
              route: '/four_four_four_breath',
            ),
            _buildExerciseContainer(
              context,
              'Derin Nefes Alma',
              'Bedeninin oksijen seviyesini artırır ve kalp atışını düşürür. Gevşeme ve meditasyonla birleştirdiğinde daha da etkili olur ve genel bir rahatlama sağlar.',
            ),
            _buildExerciseContainer(
              context,
              'Nefes Sayma',
              'Zihnini odaklamana ve rahatlamana yardımcı olur. Yavaş ve ritmik nefes alarak yaptığın bu egzersiz, meditasyon ve dikkat artırmada gerçekten etkili.',
            ),
            _buildExerciseContainer(
              context,
              'Diyafram Nefesi',
              'Daha fazla oksijen almanı sağlayarak bedenini rahatlatır. Solunum problemlerinde de çok faydalıdır ve stresi azaltarak gevşemeni destekler.',
            ),
            _buildExerciseContainer(
              context,
              'Nefes Tutma',
              'Bedeninin oksijen seviyesini artırır ve stresi azaltır. Duygu durumunu düzenlemek için de kullanabilirsin ve meditasyonla zihinsel berraklık sağlar.',
            ),
            _buildExerciseContainer(
              context,
              'Nefes Kontrolü',
              'Bedenini sakinleştirir ve zihnini odaklar. Panik ataklarında rahatlamana yardımcı olur ve stres ile anksiyeteyi yönetmede oldukça etkilidir.',
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

  Widget _buildExerciseContainer(
      BuildContext context, String title, String description,
      {String? route}) {
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
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 150, 207),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton(
              onPressed: route != null
                  ? () {
                      Navigator.pushNamed(context, route);
                    }
                  : () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
