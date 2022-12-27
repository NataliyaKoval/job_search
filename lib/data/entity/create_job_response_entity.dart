import 'package:json_annotation/json_annotation.dart';

part 'create_job_response_entity.g.dart';

@JsonSerializable()
class CreateJobResponseEntity {
  const CreateJobResponseEntity({
    required this.id,
  });

  factory CreateJobResponseEntity.fromJson(Map<String, dynamic> json) => _$CreateJobResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CreateJobResponseEntityToJson(this);

  final int id;
}