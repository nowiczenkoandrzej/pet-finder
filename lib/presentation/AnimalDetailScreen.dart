import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:carousel_slider/carousel_controller.dart' as carousel;
import 'package:go_router/go_router.dart';
import 'package:pet_finder/data/PetApi.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/data/model/Organization.dart';

class AnimalDetailScreen extends StatelessWidget {
  final AnimalDTO animal;

  void onFavouritePressed() {}

  const AnimalDetailScreen({
    Key? key,
    required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desc = (animal.description == null) ? "" : animal.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              onFavouritePressed;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dodano do ulubionych!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Karuzela ze zdjęciami
            if (animal.photos.isNotEmpty)
              carousel.CarouselSlider(
                options: carousel.CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1 / 1,
                  viewportFraction: 1.0,
                ),
                items: animal.photos.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Hero(
                        tag: 'img-${url.small}',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(url.small!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            // Informacje o zwierzęciu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    animal.breeds.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    animal.age,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    desc!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Linki
                  Text(
                    'Links:',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      try {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Otwieram: ${animal.organizationId}'),
                          ),
                        );

                        Organization organization =
                            await getOrganization(animal.organizationId);

                        if (context.mounted) {
                          context.push('/organizationDetails',
                              extra: organization);
                        }
                      } catch (e) {
                        print(e.toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Błąd: ${e.toString()}'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Organization',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
