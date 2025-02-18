import 'package:flutter/material.dart';
import 'package:pet_finder/data/model/Hours.dart';
import 'package:pet_finder/data/model/Organization.dart';
import 'package:pet_finder/data/model/SocialMedia.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizationDetailScreen extends StatelessWidget {
  final Organization organization;

  const OrganizationDetailScreen({super.key, required this.organization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(organization.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wyświetl zdjęcie organizacji
            if (organization.photos.isNotEmpty) 
              Image.network(
                organization.photos.first.medium!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              if (organization.photos.isNotEmpty) 
              const SizedBox(height: 16),
              const Divider(),
            const SizedBox(height: 16),

            // Informacje podstawowe
            Text(
              organization.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            if (organization.email != null)
              Text(
                organization.email!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            const SizedBox(height: 8),
            if (organization.phone != null)
              Text(
                organization.phone!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            const SizedBox(height: 16),

            // Adres
            Text(
              'Address:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${organization.address.address1}, ${organization.address.city}, ${organization.address.state} ${organization.address.postcode}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),

            // Godziny otwarcia
            if (organization.hours.monday != null)
              Text(
                'Hours:',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            _buildHours(context, organization.hours),
            const SizedBox(height: 16),

            // Misja organizacji
            if (organization.missionStatement != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mission Statement:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    organization.missionStatement!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            const SizedBox(height: 16),

            // Social Media
            Text(
              'Social Media:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            _buildSocialMedia(context, organization.socialMedia),
            const SizedBox(height: 16),

            // Link do strony internetowej
            if (organization.website != null)
              TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse(organization.website!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Text('Visit Website: ${organization.website}'),
              ),
          ],
        ),
      ),
    );
  }

  // Widget do wyświetlania godzin otwarcia
  Widget _buildHours(BuildContext context, Hours hours) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hours.monday != null) Text('Monday: ${hours.monday}'),
        if (hours.tuesday != null) Text('Tuesday: ${hours.tuesday}'),
        if (hours.wednesday != null) Text('Wednesday: ${hours.wednesday}'),
        if (hours.thursday != null) Text('Thursday: ${hours.thursday}'),
        if (hours.friday != null) Text('Friday: ${hours.friday}'),
        if (hours.saturday != null) Text('Saturday: ${hours.saturday}'),
        if (hours.sunday != null) Text('Sunday: ${hours.sunday}'),
      ],
    );
  }

  // Widget do wyświetlania mediów społecznościowych
  Widget _buildSocialMedia(BuildContext context, SocialMedia socialMedia) {
    return Wrap(
      spacing: 8,
      children: [
        if (socialMedia.facebook != null)
          IconButton(
            icon: const Icon(Icons.facebook),
            onPressed: () {
              // Otwórz Facebook
            },
          ),
        if (socialMedia.twitter != null)
          IconButton(
            icon: const Icon(Icons.one_x_mobiledata),
            onPressed: () {
              // Otwórz Twitter
            },
          ),
        if (socialMedia.youtube != null)
          IconButton(
            icon: const Icon(Icons.youtube_searched_for),
            onPressed: () {
              // Otwórz YouTube
            },
          ),
      ],
    );
  }
}
