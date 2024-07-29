import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Dosya yükleme
  Future<void> uploadFile(File file) async {
    try {
      String fileName = file.path.split('/').last;
      Reference ref = _storage.ref().child('uploads/$fileName');
      await ref.putFile(file);
      Fluttertoast.showToast(msg: 'Dosya başarıyla yüklendi.');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Dosya yükleme hatası: ${e.toString()}');
    }
  }

  // Dosya indirme
  Future<void> downloadFile(String fileName, String savePath) async {
    try {
      Reference ref = _storage.ref().child('uploads/$fileName');
      await ref.writeToFile(File(savePath));
      Fluttertoast.showToast(msg: 'Dosya başarıyla indirildi.');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Dosya indirme hatası: ${e.toString()}');
    }
  }
}
