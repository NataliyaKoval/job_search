import 'package:job_search/data/entity/create_job_response_entity.dart';
import 'package:job_search/data/entity/job_request_body_entity.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class CreateJobUsecase
    extends UseCase<CreateJobResponseEntity, JobRequestBodyEntity> {
  CreateJobUsecase({
    required this.repository,
  });

  final JobsRepository repository;

  @override
  Future<CreateJobResponseEntity> call(JobRequestBodyEntity params) {
    return repository.createJob(params);
  }
}
