import 'package:pet_finder/data/model/Organization.dart';
import 'package:pet_finder/data/model/Pagination.dart';

class OrganizationResponse {
  List<Organization> organizations;
  Pagination pagination;

  OrganizationResponse({required this.organizations, required this.pagination});

  factory OrganizationResponse.fromJson(Map<String, dynamic> json) {
    var orgList = json['organizations'] as List;
    List<Organization> organizationsList = orgList.map((i) => Organization.fromJson(i)).toList();

    return OrganizationResponse(
      organizations: organizationsList,
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}