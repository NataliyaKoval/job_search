import 'package:job_search/domain/models/company_jobs_response.dart';
import 'package:job_search/domain/repository/company_jobs_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class GetCompanyJobsUsecase extends UseCase<CompanyJobsResponse, String> {
  GetCompanyJobsUsecase({required this.repository});

  final CompanyJobsRepository repository;

  @override
  Future<CompanyJobsResponse> call(String params) {
    return repository.getCompanyJobs(params);
  }
}
