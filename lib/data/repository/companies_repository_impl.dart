import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/data/entity/companies_response_entity.dart';
import 'package:job_search/data/entity/company_request_body_entity.dart';
import 'package:job_search/data/entity/create_company_response_entity.dart';
import 'package:job_search/domain/models/company.dart';
import 'package:job_search/domain/repository/companies_repository.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  CompaniesRepositoryImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<Company>> getCompanies() async {
    final CompaniesResponseEntity result = await apiClient.getCompanies();
    return result.result;
  }

  @override
  Future<CreateCompanyResponseEntity> createCompany(CompanyRequestBodyEntity company) {
    return apiClient.createCompany(company);
  }
}