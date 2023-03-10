import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/presentation/single_company_screen/usecase/get_company_jobs_usecase.dart';

part 'single_company_screen_state.dart';

class SingleCompanyScreenCubit extends Cubit<SingleCompanyScreenState> {
  SingleCompanyScreenCubit({required this.getCompanyJobsUsecase})
      : super(SingleCompanyScreenInitial());

  final GetCompanyJobsUsecase getCompanyJobsUsecase;

  Future<void> getCompanyJobs(String id) async {
    try {
      final List<Job> companyJobs = await getCompanyJobsUsecase.call(id);
      emit(SingleCompanyScreenJobsLoaded(companyJobs: companyJobs));
    } catch (e) {
      emit(SingleCompanyScreenError());
    }
  }
}
