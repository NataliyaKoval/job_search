import 'package:job_search/domain/models/company_request_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_request_body_entity.g.dart';

@JsonSerializable()
class CompanyRequestBodyEntity implements CompanyRequestBody {
  const CompanyRequestBodyEntity({
    required this.name,
    required this.description,
    required this.industry,
  });

  factory CompanyRequestBodyEntity.fromJson(Map<String, dynamic> json) => _$CompanyRequestBodyEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyRequestBodyEntityToJson(this);

  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  @JsonKey(name: 'description')
  final String description;

  @override
  @JsonKey(name: 'industry')
  final String industry;
}