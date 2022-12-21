import 'package:job_search/domain/models/companies_response.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class GetCompaniesUsecase extends NoParamsUseCase<CompaniesResponse> {
  GetCompaniesUsecase({
    required this.repository,
  });

  final CompaniesRepository repository;

  @override
  Future<CompaniesResponse> call() {
    return repository.getCompanies();
  }
}
