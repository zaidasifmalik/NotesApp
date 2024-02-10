import 'package:flutter/material.dart';
import 'package:notesapp/views/homepage_view.dart';
import 'package:notesapp/views/registration_view.dart';
import 'package:notesapp/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
