import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/data/entity/create_job_response_entity.dart';
import 'package:job_search/data/entity/job_request_body_entity.dart';
import 'package:job_search/data/entity/jobs_response_entity.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';

class JobsRepositoryImpl implements JobsRepository {
  final ApiClient apiClient;

  JobsRepositoryImpl(this.apiClient);

  @override
  Future<List<Job>> getJobs() async {
    final JobsResponseEntity result = await apiClient.getJobs();
    return result.result;
  }

  @override
  Future<CreateJobResponseEntity> createJob(JobRequestBodyEntity job) {
    return apiClient.createJob(job);
  }
}
