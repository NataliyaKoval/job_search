import 'package:job_search/data/entity/job_entity.dart';
import 'package:job_search/domain/models/company_jobs_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_jobs_response_entity.g.dart';

@JsonSerializable()
class CompanyJobsResponseEntity implements CompanyJobsResponse {
  CompanyJobsResponseEntity(this.result);

  factory CompanyJobsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyJobsResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyJobsResponseEntityToJson(this);

  @override
  @JsonKey(name: 'result')
  final List<JobEntity> result;
}
