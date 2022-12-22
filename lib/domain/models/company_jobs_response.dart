import 'package:job_search/domain/models/job.dart';

class CompanyJobsResponse {
  CompanyJobsResponse(this.result);

  final List<Job> result;
}