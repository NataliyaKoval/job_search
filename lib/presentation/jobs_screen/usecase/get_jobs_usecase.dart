import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class GetJobsUsecase extends NoParamsUseCase<List<Job>> {
  GetJobsUsecase({
    required this.repository,
  });

  final JobsRepository repository;

  @override
  Future<List<Job>> call() {
    return repository.getJobs();
  }
}

