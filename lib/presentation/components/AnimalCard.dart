import 'package:flutter/material.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';

class AnimalLCard extends StatelessWidget {
  final AnimalDTO animal;
  final Icon icon;
  final VoidCallback onFavouritePressed;
  final VoidCallback onTap;

  const AnimalLCard(
      {super.key,
      required this.animal,
      required this.onFavouritePressed,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    String? imgUrl = (animal.photos.isEmpty || animal.photos[0].small == null)
        ? null
        : animal.photos[0].small!;

    return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3))
              ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imgUrl != null
                      ? Hero(
                          tag: 'img-$imgUrl',
                          child: Image.network(
                            imgUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholder();
                            },
                          ),
                        )
                      : _buildPlaceholder(),
                )),
            const SizedBox(height: 8),
            Text(
              animal.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              animal.gender ?? "",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              animal.age ?? "",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: icon,
                onPressed: onFavouritePressed,
              ),
            ),
          ]),
        ));
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200], // Szare tło jako placeholder
      child: const Center(
        child: Icon(
          Icons.image, // Ikona obrazu
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }
}
