import 'package:flutter/material.dart';
import 'package:pet_finder/data/PetApi.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/presentation/AnimalListScreen.dart';
import 'package:pet_finder/presentation/AnimalDetailScreen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AnimalListScreen(
        title: "Pet Finder",
        callDetails: CallDetails(page: 1, type: AnimalType.ALL),
      ),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => AnimalDetailScreen(
        animal: state.extra as AnimalDTO
      )
    ),
    GoRoute(
      path: '/cats',
      builder: (context, state) => AnimalListScreen(
        title: "Cats",
        callDetails: CallDetails(page: 1, type: AnimalType.CAT),
      ),
    ),
    GoRoute(
      path: '/dogs',
      builder: (context, state) => AnimalListScreen(
        title: "Dogs",
        callDetails: CallDetails(page: 1, type: AnimalType.DOG),
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
