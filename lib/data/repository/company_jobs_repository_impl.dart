import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/data/entity/company_jobs_response_entity.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/repository/company_jobs_repository.dart';

class CompanyJobsRepositoryImpl implements CompanyJobsRepository {
  CompanyJobsRepositoryImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<Job>> getCompanyJobs(String id) async {
    final CompanyJobsResponseEntity result = await apiClient.getCompanyJobs(id);
    return result.result;
  }
}