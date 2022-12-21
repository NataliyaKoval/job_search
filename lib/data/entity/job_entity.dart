import 'package:job_search/domain/models/job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_entity.g.dart';

@JsonSerializable()
class JobEntity implements Job {

  const JobEntity({
    required this.id,
    required this.companyId,
    required this.title,
    required this.description,
    required this.city,
  });

  factory JobEntity.fromJson(Map<String, dynamic> json) => _$JobEntityFromJson(json);
  Map<String, dynamic> toJson() => _$JobEntityToJson(this);

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  @JsonKey(name: 'companyId')
  final int companyId;

  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  @JsonKey(name: 'description')
  final String description;

  @override
  @JsonKey(name: 'city')
  final String city;
}
