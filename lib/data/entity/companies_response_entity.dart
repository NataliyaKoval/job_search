import 'package:job_search/data/entity/company_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_response_entity.g.dart';

@JsonSerializable()
class CompaniesResponseEntity {
  CompaniesResponseEntity(this.result);

  factory CompaniesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesResponseEntityToJson(this);

  @JsonKey(name: 'result')
  final List<CompanyEntity> result;
}
