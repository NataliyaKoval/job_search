import 'package:job_search/data/entity/company_request_body_entity.dart';
import 'package:job_search/data/entity/create_company_response_entity.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/domain/usecase/usecase.dart';

class CreateCompanyUsecase
    extends UseCase<CreateCompanyResponseEntity, CompanyRequestBodyEntity> {
  CreateCompanyUsecase({
    required this.repository,
  });

  final CompaniesRepository repository;

  @override
  Future<CreateCompanyResponseEntity> call(CompanyRequestBodyEntity params) {
    return repository.createCompany(params);
  }
}
