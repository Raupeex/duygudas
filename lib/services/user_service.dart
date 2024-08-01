import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../models/user.dart' as app_model;

class UserService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<app_model.User> fetchUser() async {
    final firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      final userDoc =
          await _firestore.collection('users').doc(firebaseUser.uid).get();
      if (userDoc.exists) {
        final data = userDoc.data()!;
        return app_model.User(
          avatar: data['avatar'] ?? 'assets/images/fox.png',
          name: data['name'] ?? 'Ad Yok',
          surname: data['surname'] ?? 'Soyad Yok',
          nickname: data['nickname'] ?? 'Rumuz Yok',
          phone: data['phone'] ?? 'Telefon Numarası Yok',
          email: data['email'] ?? firebaseUser.email ?? 'Email Yok',
          diagnosis: data['diagnosis'] ?? 'Psikolojik Rahatsızlık Tanıları Yok',
          medications: data['medications'] ?? 'Kullanılan İlaçlar Yok',
        );
      } else {
        throw Exception('Kullanıcı verisi Firestore\'da bulunamadı');
      }
    } else {
      throw Exception('Kullanıcı oturumu açık değil');
    }
  }
}
