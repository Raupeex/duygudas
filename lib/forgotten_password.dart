import 'package:flutter/material.dart';

class ForgottenPasswordPage extends StatefulWidget {
  @override
  _ForgottenPasswordPageState createState() => _ForgottenPasswordPageState();
}

class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() {
    // Örnek kontrol: TC kimlik numarası ve mail adresi doğruluğunu kontrol edelim.
    String tc = _tcController.text;
    String email = _emailController.text;

    if (tc == "12345678901" && email == "example@example.com") {
      // Doğru bilgiler girildiyse
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mailinize şifreniz gönderildi.'),
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
          context, '/login_register', (route) => false);
    } else {
      // Yanlış bilgiler girildiyse
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('TC ya da mail adresi yanlış.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifreyi Sıfırla'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _tcController,
              decoration: InputDecoration(labelText: 'TC Kimlik Numarası'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Mail Adresi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Şifreyi Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }
}
