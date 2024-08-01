import 'package:flutter/material.dart';
import 'screens/login_register.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/splash_screen.dart';
import 'screens/autogenetic.dart';
import 'screens/breathing_exercises.dart';
import 'screens/edit_profile.dart';
import 'screens/exercises.dart';
import 'screens/forgotten_password.dart';
import 'screens/four_four_four_breath.dart';
import 'screens/main_page.dart';
import 'screens/personal_information.dart';
import 'screens/professional_support.dart';
import 'screens/relaxation_exercises.dart';
import 'screens/test_phq9.dart';
import 'screens/test_results.dart';
import 'screens/tests.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login_register': (context) => LoginRegisterPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/main_page': (context) => MainPage(),
        '/tests': (context) => TestsPage(),
        '/exercises': (context) => ExercisesPage(),
        '/breathing_exercises': (context) => BreathingExercisesPage(),
        '/relaxation_exercises': (context) => RelaxationExercisesPage(),
        '/professional_support': (context) => ProfessionalSupportPage(),
        '/test_results': (context) => TestResultsPage(),
        '/four_four_four_breath': (context) => FourFourFourBreathPage(),
        '/autogenetic': (context) => AutogeneticPage(),
        '/test_phq9': (context) => TestPHQ9Page(),
        '/personal_information': (context) => PersonalInformationPage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/forgotten_password': (context) => ForgottenPasswordPage(),
      },
    );
  }
}
