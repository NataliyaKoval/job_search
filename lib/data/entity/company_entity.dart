import 'package:job_search/domain/models/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_entity.g.dart';

@JsonSerializable()
class CompanyEntity implements Company {
  const CompanyEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.industry,
  });

  factory CompanyEntity.fromJson(Map<String, dynamic> json) => _$CompanyEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyEntityToJson(this);


  @override
  @JsonKey(name: 'id')
  final int id;

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