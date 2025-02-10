import 'package:pet_finder/data/model/Links.dart';

class Pagination {
  final int? countPerPage;
  final int? totalCount;
  final int? currentPage;
  final int? totalPages;
  final Links? links;

  Pagination({
    required this.countPerPage,
    required this.totalCount,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic>? json) {

    if (json == null) {
      return Pagination(
        countPerPage: null,
        totalCount: null,
        currentPage: null,
        totalPages: null,
        links: null,
      );
    }

    return Pagination(
      countPerPage: json['count_per_page'],
      totalCount: json['total_count'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      links: Links.fromJson(json['_links']),
    );
  }
}
