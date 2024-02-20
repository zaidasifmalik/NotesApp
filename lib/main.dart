import 'package:flutter/material.dart';
import 'package:notesapp/views/homepage_view.dart';
import 'package:notesapp/views/login_view.dart';
import 'package:notesapp/views/registration_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/registration/': (context) => const RegistrationView(),
        '/login/': (context) => const LoginView(),
        //'/home': (context) => const HomePage()
  },
  //initialRoute: '/home',
    );
  }
}
