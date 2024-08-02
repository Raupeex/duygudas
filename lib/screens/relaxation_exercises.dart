import 'package:flutter/material.dart';

class RelaxationExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title: Text(
          'Gevşeme Egzersizleri',
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
            _buildExerciseContainer(
              context,
              'Otojenik Gevşeme Terapisi',
              'Zihinsel rahatlama sağlamak için belirli yönergeleri takip ederek bedenini ve zihnini gevşetmeni sağlar. Beş farklı konsantrasyon seviyesi sayesinde bedenini ve zihnini rahatlatırsın.',
              route: '/autogenetic',
            ),
            _buildExerciseContainer(
              context,
              'Tüm Vücut Gevşeme Egzersizleri',
              'Kaslarını sırayla kasar ve gevşeterek hem zihinsel hem de fiziksel rahatlama sağlar. Kasılma ve gevşeme döngüsü, bedenin genel gevşemesine yardımcı olur.',
            ),
            _buildExerciseContainer(
              context,
              'Görselleştirme (İmajinasyon)',
              'Zihninde rahatlatıcı bir sahne veya durum hayal ederek zihinsel rahatlama ve stres azaltma sağlar. Doğal ortamları hayal etmek özellikle etkilidir.',
            ),
            _buildExerciseContainer(
              context,
              'Progresif Kas Gevşetme',
              'Kaslarını kasıp gevşeterek zihinsel ve fiziksel rahatlama sağlar. Hem terapist eşliğinde hem de kendi başına uygulanabilir.',
            ),
            _buildExerciseContainer(
              context,
              'Meditasyon',
              'Odaklanma ve zihinsel disiplinle zihni ve bedeni rahatlatır. Farkındalık ve bilinçli bir yaşam sürme konusunda da fayda sağlar.',
            ),
            _buildExerciseContainer(
              context,
              'Yoga',
              'Beden ve zihin arasındaki bağlantıyı güçlendirir. Esneme, nefes kontrolü ve zihni sakinleştirme ile rahatlama sağlar.',
            ),
            _buildExerciseContainer(
              context,
              'Otomatik Yazma',
              'Düşünce ve duygularını serbestçe ifade etmeni sağlar. Stresi azaltır ve duygularını anlamana yardımcı olur.',
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
              color: Color(0xFF36DCD9),
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
