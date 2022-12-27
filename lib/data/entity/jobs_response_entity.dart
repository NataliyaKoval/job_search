import 'package:job_search/data/entity/job_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobs_response_entity.g.dart';

@JsonSerializable()
class JobsResponseEntity {
  JobsResponseEntity(this.result);

  factory JobsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$JobsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobsResponseEntityToJson(this);

  @override
  @JsonKey(name: 'result')
  final List<JobEntity> result;
}
