import 'package:flutter/material.dart';
import 'package:pet_finder/data/model/Organization.dart';

class OrganizationCard extends StatelessWidget {
  final Organization organization;
  final VoidCallback onFavouritePressed;
  final VoidCallback onTap;

  const OrganizationCard({
    Key? key,
    required this.organization,
    required this.onFavouritePressed,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0, // Cień karty
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ), // Zaokrąglone rogi
      child: InkWell(
        onTap: onTap, // Przejście do szczegółów
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (organization.photos.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    organization
                        .photos.first.small!, // Użyj średniego rozmiaru zdjęcia
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(width: 16), // Odstęp między zdjęciem a tekstem
              // Informacje o organizacji
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nazwa organizacji
                    Text(
                      organization.name,
                      style:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Miasto
                    Text(
                      organization.address.city!,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                    ),
                    const SizedBox(height: 4),
                    // Email (jeśli dostępny)
                    if (organization.email != null)
                      Text(
                        organization.email!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
