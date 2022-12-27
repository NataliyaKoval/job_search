import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/repository/company_jobs_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class GetCompanyJobsUsecase extends UseCase<List<Job>, String> {
  GetCompanyJobsUsecase({required this.repository});

  final CompanyJobsRepository repository;

  @override
  Future<List<Job>> call(String params) {
    return repository.getCompanyJobs(params);
  }
}
