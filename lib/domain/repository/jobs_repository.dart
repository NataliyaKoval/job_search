import 'package:job_search/data/entity/create_job_response_entity.dart';
import 'package:job_search/data/entity/job_request_body_entity.dart';
import 'package:job_search/domain/models/job.dart';

abstract class JobsRepository {
  Future<List<Job>> getJobs();

  Future<CreateJobResponseEntity> createJob(
      JobRequestBodyEntity job);
}