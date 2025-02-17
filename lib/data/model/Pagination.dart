

class Pagination {
  final int? countPerPage;
  final int? totalCount;
  final int? currentPage;
  final int? totalPages;

  Pagination({
    required this.countPerPage,
    required this.totalCount,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic>? json) {

    if (json == null) {
      return Pagination(
        countPerPage: null,
        totalCount: null,
        currentPage: null,
        totalPages: null,
      );
    }

    return Pagination(
      countPerPage: json['count_per_page'],
      totalCount: json['total_count'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
    );
  }
}
