import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_finder/data/AnimalResponse.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String? access_token;

Future getPetfinderToken() async {
  
  await dotenv.load(fileName: ".env");

  final clientId = dotenv.env['CLIENT_ID'];
  final clientSecret = dotenv.env['CLIENT_SECRET'];
  final response = await http.post(
    Uri.parse('https://api.petfinder.com/v2/oauth2/token'),
    body: {
      'grant_type': 'client_credentials',
      'client_id': clientId,
      'client_secret': clientSecret,
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    access_token = data['access_token'];
  } else {
    throw Exception('Failed to load token');
  }
}

Future<AnimalsResponse> fetchAnimals() async {
  if (access_token == null) {
    await getPetfinderToken();
  }

  final response = await http.get(
    Uri.parse('https://api.petfinder.com/v2/animals?page=1'),
    headers: {
      'Authorization': 'Bearer $access_token',
    },
  );

  if (response.statusCode == 200) {
    var result = AnimalsResponse.fromJson(json.decode(response.body));

    return result;
  } else {
    throw Exception('Failed to load animals');
  }
}
