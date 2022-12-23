import 'package:job_search/domain/models/company.dart';

abstract class CompaniesRepository {
  Future<List<Company>> getCompanies();
}