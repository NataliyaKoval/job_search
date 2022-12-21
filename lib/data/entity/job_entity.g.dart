// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobEntity _$JobEntityFromJson(Map<String, dynamic> json) => JobEntity(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$JobEntityToJson(JobEntity instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'title': instance.title,
      'description': instance.description,
      'city': instance.city,
    };
