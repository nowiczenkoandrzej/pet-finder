import 'package:flutter/material.dart';
import 'package:pet_finder/data/AnimalResponse.dart';
import 'package:pet_finder/data/PetApi.dart';
import 'package:pet_finder/presentation/AnimalCard.dart';
import 'package:pet_finder/presentation/AnimalDetailsBottomSheet';
import 'package:pet_finder/presentation/NavDrawer.dart';



class AnimalListScreen extends StatefulWidget {
  final String title;

  const AnimalListScreen({
    super.key,
    required this.title,
  });

  @override
  State<AnimalListScreen> createState() => _AnimalListScreen();
}

class _AnimalListScreen extends State<AnimalListScreen> {
  Future<AnimalsResponse>? futureAnimals;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAnimals();
    });
  }

  void loadAnimals() async {
    try {
      setState(() {
        futureAnimals = fetchAnimals();
      });
    } catch (e) {
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
        body: FutureBuilder<AnimalsResponse>(
            future: futureAnimals,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.animals.isEmpty) {
                return Center(child: Text('No animals found'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.animals.length,
                  itemBuilder: (context, index) {
                    var animal = snapshot.data!.animals[index];

                    return AnimalLCard(
                      animal: animal,
                      onFavouritePressed: () {
                        print(animal.name);
                      },
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AnimalDetailsBottomSheet(animal: animal);
                            });
                      },
                    );
                  },
                );
              }
            }));
  }
}
