// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_request_body_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRequestBodyEntity _$CompanyRequestBodyEntityFromJson(
        Map<String, dynamic> json) =>
    CompanyRequestBodyEntity(
      name: json['name'] as String,
      description: json['description'] as String,
      industry: json['industry'] as String,
    );

Map<String, dynamic> _$CompanyRequestBodyEntityToJson(
        CompanyRequestBodyEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'industry': instance.industry,
    };
