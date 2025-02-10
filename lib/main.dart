import 'package:flutter/material.dart';
import 'package:pet_finder/presentation/AnimalListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const AnimalListScreen(title: 'Pet Finder'),
    );
  }
}
