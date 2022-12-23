import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class FilterJobsUsecase extends UseCase<List<Job>, FilterParams> {
  @override
  Future<List<Job>> call(params) async {
    return params.allJobs
        .where((element) => element.city.contains(params.filter))
        .toList();
  }
}

class FilterParams {
  const FilterParams({
    required this.allJobs,
    required this.filter,
  });

  final List<Job> allJobs;
  final String filter;
}
