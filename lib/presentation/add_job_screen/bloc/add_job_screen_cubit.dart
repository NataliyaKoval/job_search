import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/data/entity/job_request_body_entity.dart';
import 'package:job_search/domain/models/company.dart';
import 'package:job_search/presentation/add_job_screen/usecase/create_job_usecase.dart';
import 'package:job_search/presentation/companies_screen/usecase/get_companies_usecase.dart';

part 'add_job_screen_state.dart';

class AddJobScreenCubit extends Cubit<AddJobScreenState> {
  AddJobScreenCubit({
    required this.getCompaniesUsecase,
    required this.createJobUsecase,
  }) : super(AddJobScreenInitial());

  final GetCompaniesUsecase getCompaniesUsecase;
  final CreateJobUsecase createJobUsecase;
  List<Company> companies = [];

  Future<void> getAllCompanies() async {
    try {
      companies = await getCompaniesUsecase.call();
      emit(AddJobScreenCompaniesLoaded(companiesList: companies));
    } catch (e) {
      emit(AddJobScreenError(e.toString()));
    }
  }

  Future<void> createJob({
    required String title,
    required String description,
    required String city,
    required int companyId,
  }) async {
    try {
      final JobRequestBodyEntity jobRequestBodyEntity = JobRequestBodyEntity(
        title: title,
        description: description,
        city: city,
        companyId: companyId,
      );
      await createJobUsecase.call(jobRequestBodyEntity);
    } catch (e) {
      emit(AddJobScreenError(e.toString()));
    }
  }
}
