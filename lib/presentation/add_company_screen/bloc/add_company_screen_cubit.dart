import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/data/entity/company_request_body_entity.dart';
import 'package:job_search/presentation/add_company_screen/usecase/create_company_usecase.dart';

part 'add_company_screen_state.dart';

class AddCompanyScreenCubit extends Cubit<AddCompanyScreenState> {
  AddCompanyScreenCubit({required this.createCompanyUsecase})
      : super(AddCompanyScreenInitial());

  final CreateCompanyUsecase createCompanyUsecase;

  Future<void> createCompany({
    required String name,
    required String description,
    required String industry,
  }) async {
    try {
      final CompanyRequestBodyEntity companyRequestBodyEntity =
          CompanyRequestBodyEntity(
              name: name, description: description, industry: industry);
      await createCompanyUsecase.call(companyRequestBodyEntity);
    } catch (e) {
      emit(AddCompanyScreenError(e.toString()));
    }
  }
}
