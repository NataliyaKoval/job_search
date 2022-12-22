// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_jobs_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyJobsResponseEntity _$CompanyJobsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CompanyJobsResponseEntity(
      (json['result'] as List<dynamic>)
          .map((e) => JobEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyJobsResponseEntityToJson(
        CompanyJobsResponseEntity instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
