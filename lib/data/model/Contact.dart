import 'package:pet_finder/data/model/Address.dart';

class Contact {
  final String? email;
  final String? phone;
  final Address? address;

  Contact({
    required this.email,
    this.phone,
    required this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      phone: json['phone'],
      address: Address.fromJson(json['address']),
    );
  }
}
