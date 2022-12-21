// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesResponseEntity _$CompaniesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CompaniesResponseEntity(
      (json['result'] as List<dynamic>)
          .map((e) => CompanyEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompaniesResponseEntityToJson(
        CompaniesResponseEntity instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
