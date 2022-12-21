import 'package:job_search/domain/models/jobs_response.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class GetJobsUsecase extends NoParamsUseCase<JobsResponse> {
  GetJobsUsecase({
    required this.repository,
  });

  final JobsRepository repository;

  @override
  Future<JobsResponse> call() {
    return repository.getJobs();
  }
}

