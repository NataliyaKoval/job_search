import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/domain/models/jobs_response.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';

class JobsRepositoryImpl implements JobsRepository {
  final ApiClient apiClient;

  JobsRepositoryImpl(this.apiClient);

  @override
  Future<JobsResponse> getJobs() {
    return apiClient.getJobs();
  }
}
