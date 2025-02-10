class Attributes {
  final bool? spayedNeutered;
  final bool? houseTrained;
  final bool? declawed;
  final bool? specialNeeds;
  final bool? shotsCurrent;

  Attributes({
    required this.spayedNeutered,
    required this.houseTrained,
    this.declawed,
    required this.specialNeeds,
    required this.shotsCurrent,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      spayedNeutered: json['spayed_neutered'],
      houseTrained: json['house_trained'],
      declawed: json['declawed'],
      specialNeeds: json['special_needs'],
      shotsCurrent: json['shots_current'],
    );
  }
}
