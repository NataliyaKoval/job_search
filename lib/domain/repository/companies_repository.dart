import 'package:job_search/data/entity/company_request_body_entity.dart';
import 'package:job_search/data/entity/create_company_response_entity.dart';
import 'package:job_search/domain/models/company.dart';

abstract class CompaniesRepository {
  Future<List<Company>> getCompanies();

  Future<CreateCompanyResponseEntity> createCompany(
      CompanyRequestBodyEntity company);
}
