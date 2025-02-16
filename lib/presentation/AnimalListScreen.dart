import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_finder/data/AnimalResponse.dart';
import 'package:pet_finder/data/FavouriteRepository.dart';
import 'package:pet_finder/data/PetApi.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/presentation/components/AnimalCard.dart';
import 'package:pet_finder/presentation/components/NavDrawer.dart';

class AnimalListScreen extends StatefulWidget {
  final String title;
  final CallDetails callDetails;

  const AnimalListScreen(
      {super.key, required this.title, required this.callDetails});

  @override
  State<AnimalListScreen> createState() => _AnimalListScreen();
}

class _AnimalListScreen extends State<AnimalListScreen> {
  Future<AnimalsResponse>? futureAnimals;

  final FavouriteRepository _favouriteRepository = FavouriteRepository();

  List<int> favouriteIds = [];

  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;
  List<AnimalDTO> animals = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAnimals();
    });

    //favouriteIds = await _favouriteRepository.getAllId();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        hasMore) {
      loadAnimals();
    }
  }

  void loadAnimals() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    try {
      CallDetails newCall =
          CallDetails(page: currentPage, type: widget.callDetails.type);

      var response = await buildCall(newCall);
      setState(() {
        animals.addAll(response.animals);
        isLoading = false;
        hasMore = response.animals
            .isNotEmpty; // Zakładamy, że jeśli nie ma zwierząt, to nie ma więcej stron
        currentPage++;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: NavDrawer(),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: animals.length + 1,
          itemBuilder: (context, index) {
            if (index < animals.length) {
              var animal = animals[index];

              bool isFavorite = favouriteIds.contains(animal.id);

              var icon = Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined);

              return AnimalLCard(
                animal: animal,
                onFavouritePressed: () {
                  if (isFavorite)
                    _favouriteRepository.removeId(animal.id);
                  else
                    _favouriteRepository.addAnimalId(animal.id);
                  setState(() async {
                    favouriteIds = await _favouriteRepository.getAllId();
                  });
                },
                onTap: () {
                  context.push('/details', extra: animal);
                },
                icon: icon,
              );
            } else if (hasMore) {
              return Column(children: [
                SizedBox(
                  height: 60,
                ),
                CircularProgressIndicator(),
                SizedBox(
                  height: 60,
                ),
              ]);
            } else {
              return SizedBox();
            }
          },
        ));
  }
}
