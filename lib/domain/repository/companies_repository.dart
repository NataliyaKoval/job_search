import 'package:job_search/domain/models/companies_response.dart';

abstract class CompaniesRepository {
  Future<CompaniesResponse> getCompanies();
}