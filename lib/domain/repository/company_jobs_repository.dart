import 'package:job_search/domain/models/company_jobs_response.dart';

abstract class CompanyJobsRepository {
  Future<CompanyJobsResponse> getCompanyJobs(String id);
}