import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/domain/models/companies_response.dart';
import 'package:job_search/domain/repository/companies_repository.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  CompaniesRepositoryImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<CompaniesResponse> getCompanies() {
    return apiClient.getCompanies();
  }
}