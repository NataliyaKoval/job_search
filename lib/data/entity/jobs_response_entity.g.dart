// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobsResponseEntity _$JobsResponseEntityFromJson(Map<String, dynamic> json) =>
    JobsResponseEntity(
      (json['result'] as List<dynamic>)
          .map((e) => JobEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobsResponseEntityToJson(JobsResponseEntity instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
