import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_finder/data/AnimalResponse.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_finder/data/OrganizationResponse.dart';
import 'package:pet_finder/data/model/Organization.dart';

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

Future<AnimalsResponse> buildCall(CallDetails details) async {
  if (access_token == null) {
    await getPetfinderToken();
  }

  String type;
  switch (details.type) {
    case AnimalType.ALL:
      type = '';
      break;
    case AnimalType.CAT:
      type = 'type=cat&';
      break;
    case AnimalType.DOG:
      type = 'type=dog&';
      break;
    default:
      type = '';
      break;
  }

  final response = await http.get(
    Uri.parse(
        'https://api.petfinder.com/v2/animals?${type}page=${details.page}'),
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

Future<OrganizationResponse> fetchOrganizations() async {
  if (access_token == null) {
    await getPetfinderToken();
  }

  final response = await http.get(
    Uri.parse('https://api.petfinder.com/v2/organizations'),
    headers: {
      'Authorization': 'Bearer $access_token',
    },
  );

  if (response.statusCode == 200) {
    var result = OrganizationResponse.fromJson(json.decode(response.body));

    return result;
  } else {
    throw Exception('Failed to load organization');
  }
}

Future<Organization> getOrganization(String id) async {
  if (access_token == null) {
    await getPetfinderToken();
  }

  final response = await http.get(
    Uri.parse('https://api.petfinder.com/v2/organizations/$id'),
    headers: {
      'Authorization': 'Bearer $access_token',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);

    final organizationData = jsonData['organization'];
    return Organization.fromJson(organizationData);
  } else {
    throw Exception('Failed to load organization');
  }
}

class CallDetails {
  final int page;
  final AnimalType type;

  const CallDetails({required this.page, required this.type});
}

enum AnimalType { DOG, CAT, ALL }
