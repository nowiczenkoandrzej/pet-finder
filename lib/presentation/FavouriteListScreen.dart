import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:pet_finder/data/FavouriteRepository.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/presentation/components/AnimalCard.dart';
import 'package:pet_finder/presentation/components/NavDrawer.dart';



class Favouritelistscreen extends StatefulWidget {
  

  const Favouritelistscreen(
      {super.key});

  @override
  State<Favouritelistscreen> createState() => _Favouritelistscreen();
}

class _Favouritelistscreen extends State<Favouritelistscreen> {

  final FavouriteRepository _favouriteRepository = FavouriteRepository();

  //List<AnimalDTO> favourites = [];
  final String boxName = "animalBox";

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
        ),
        drawer: NavDrawer(),
        body: ValueListenableBuilder(
            valueListenable: _favouriteRepository.getListenableBox(),
            builder: (context, Box<AnimalDTO> box, _) {
              final favourites = box.values.toList();
              return ListView.builder(
                itemCount: favourites.length,
                itemBuilder: (context, index) {
                  if (index < favourites.length) {
                    var animal = favourites[index];

                    bool isFavorite = favourites.contains(animal);

                    var icon = Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border);

                    var testIcon = Icon(Icons.favorite);

                    return AnimalLCard(
                      animal: animal,
                      onFavouritePressed: () {
                        if (isFavorite) {
                          _favouriteRepository.removeAnimal(animal.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Removed from favourites')),
                          );
                        } else {
                          _favouriteRepository.addAnimal(animal);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Added to favourites')),
                          );
                        }
                      },
                      onTap: () {
                        context.push('/details', extra: animal);
                      },
                      icon: icon,
                    );
                  } 
                },
              );
            }));
  }
}
