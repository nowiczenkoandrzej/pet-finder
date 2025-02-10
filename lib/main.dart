import 'package:flutter/material.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/presentation/AnimalListScreen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AnimalListScreen(title: "Pet Finder",),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => AnimalDeta,
    ),
  ],
);



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
