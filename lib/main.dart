import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:earthquake/pages/auth.dart';
import 'package:earthquake/pages/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Inisialisasi Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(), // Atur halaman pertama di sini
    );
  }
}
