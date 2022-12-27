import 'package:job_search/domain/models/job.dart';

abstract class JobsRepository {
  Future<List<Job>> getJobs();
}