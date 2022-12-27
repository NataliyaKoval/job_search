import 'package:json_annotation/json_annotation.dart';

part 'create_company_response_entity.g.dart';

@JsonSerializable()
class CreateCompanyResponseEntity {
  const CreateCompanyResponseEntity({
    required this.id,
  });

  factory CreateCompanyResponseEntity.fromJson(Map<String, dynamic> json) => _$CreateCompanyResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCompanyResponseEntityToJson(this);

  final int id;
}