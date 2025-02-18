import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_finder/data/PetApi.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/data/model/Breeds.dart';
import 'package:pet_finder/data/model/Organization.dart';
import 'package:pet_finder/data/model/Photo.dart';
import 'package:pet_finder/presentation/AnimalListScreen.dart';
import 'package:pet_finder/presentation/AnimalDetailScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_finder/presentation/FavouriteListScreen.dart';
import 'package:pet_finder/presentation/OrganizarionDetailScreen.dart';
import 'package:pet_finder/presentation/OrganizationListScreen';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AnimalDTOAdapter());
  Hive.registerAdapter(BreedsAdapter());
  Hive.registerAdapter(PhotoAdapter());
  await Hive.openBox<AnimalDTO>('animalBox');
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
        builder: (context, state) =>
            AnimalDetailScreen(animal: state.extra as AnimalDTO)),
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
    GoRoute(
        path: '/organizations',
        builder: (context, state) => OrganizationListScreen()
    ),
    GoRoute(
        path: '/organizationDetails',
        builder: (context, state) =>
            OrganizationDetailScreen(organization: state.extra as Organization)
    ),
    GoRoute(
        path: '/favourites',
        builder: (context, state) => Favouritelistscreen()
    )
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
