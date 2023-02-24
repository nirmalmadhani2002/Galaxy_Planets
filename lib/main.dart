import 'package:flutter/material.dart';
import 'package:galaxy_planets/screens/HomePage.dart';
import 'package:galaxy_planets/views/Planets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'planets': (context) => const Planets(),
      },
    );
  }
}
