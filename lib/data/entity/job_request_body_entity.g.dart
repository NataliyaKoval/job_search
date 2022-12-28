// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_request_body_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequestBodyEntity _$JobRequestBodyEntityFromJson(
        Map<String, dynamic> json) =>
    JobRequestBodyEntity(
      title: json['title'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      companyId: json['companyId'] as int,
    );

Map<String, dynamic> _$JobRequestBodyEntityToJson(
        JobRequestBodyEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'city': instance.city,
      'companyId': instance.companyId,
    };
