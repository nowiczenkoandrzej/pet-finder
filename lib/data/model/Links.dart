import 'package:pet_finder/data/model/Link.dart';

class Links {
  final Link? self;
  final Link? type;
  final Link? organization;

  Links({
    this.self,
    this.type,
    this.organization,
  });

  factory Links.fromJson(Map<String, dynamic>? json) {

    if (json == null) {
      return Links(
        self: null,
        type: null,
        organization: null,
      );
    }

    return Links(
      self: json['self'] != null ? Link.fromJson(json['self']) : null,
      type: json['type'] != null ? Link.fromJson(json['type']) : null,
      organization: json['organization'] != null
          ? Link.fromJson(json['organization'])
          : null,
    );
  }
}
