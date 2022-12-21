// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEntity _$CompanyEntityFromJson(Map<String, dynamic> json) =>
    CompanyEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      industry: json['industry'] as String,
    );

Map<String, dynamic> _$CompanyEntityToJson(CompanyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'industry': instance.industry,
    };
