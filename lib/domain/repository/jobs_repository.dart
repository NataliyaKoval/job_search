import 'package:job_search/domain/models/jobs_response.dart';

abstract class JobsRepository {
  Future<JobsResponse> getJobs();
}