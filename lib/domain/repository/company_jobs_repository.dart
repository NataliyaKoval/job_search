import 'package:job_search/domain/models/job.dart';

abstract class CompanyJobsRepository {
  Future<List<Job>> getCompanyJobs(String id);
}