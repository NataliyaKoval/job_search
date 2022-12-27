import 'package:job_search/domain/models/company.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class GetCompaniesUsecase extends NoParamsUseCase<List<Company>> {
  GetCompaniesUsecase({
    required this.repository,
  });

  final CompaniesRepository repository;

  @override
  Future<List<Company>> call() {
    return repository.getCompanies();
  }
}
