import 'package:job_search/domain/models/company_request_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_request_body_entity.g.dart';

@JsonSerializable()
class JobRequestBodyEntity {
  const JobRequestBodyEntity({
    required this.title,
    required this.description,
    required this.city,
    required this.companyId,
  });

  factory JobRequestBodyEntity.fromJson(Map<String, dynamic> json) =>
      _$JobRequestBodyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobRequestBodyEntityToJson(this);

  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  @JsonKey(name: 'description')
  final String description;

  @override
  @JsonKey(name: 'city')
  final String city;

  @override
  @JsonKey(name: 'companyId')
  final int companyId;
}
