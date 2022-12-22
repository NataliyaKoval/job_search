import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/domain/models/company_jobs_response.dart';
import 'package:job_search/domain/repository/company_jobs_repository.dart';

class CompanyJobsRepositoryImpl implements CompanyJobsRepository {
  CompanyJobsRepositoryImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<CompanyJobsResponse> getCompanyJobs(String id) {
    return apiClient.getCompanyJobs(id);
  }
}