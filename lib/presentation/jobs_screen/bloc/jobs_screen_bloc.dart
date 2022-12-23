import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/models/jobs_response.dart';
import 'package:job_search/presentation/jobs_screen/usecase/filter_jobs_usecase.dart';
import 'package:job_search/presentation/jobs_screen/usecase/get_jobs_usecase.dart';

part 'jobs_screen_event.dart';

part 'jobs_screen_state.dart';

class JobsScreenBloc extends Bloc<JobsScreenEvent, JobsScreenState> {
  JobsScreenBloc(
      {required this.filterJobsUsecase, required this.getJobsUsecase})
      : super(JobsScreenInitial()) {
    on<GetAllJobsEvent>(_getAllJobs);
    on<FilterJobsEvent>(_filterJobs);
  }

  final GetJobsUsecase getJobsUsecase;
  final FilterJobsUsecase filterJobsUsecase;

  List<Job> allJobsList = [];

  Future<void> _getAllJobs(
      GetAllJobsEvent event, Emitter<JobsScreenState> emit) async {
    try {
      emit(JobsScreenLoading());
      final JobsResponse response = await getJobsUsecase.call();
      allJobsList = response.result;
      emit(JobsScreenLoaded(allJobsList));
    } catch (e) {
      emit(JobsScreenError());
    }
  }

  void _filterJobs(FilterJobsEvent event, Emitter<JobsScreenState> emit) async {
    final filteredJobs = await filterJobsUsecase
        .call(FilterParams(allJobs: allJobsList, filter: event.filter));
    emit(JobsScreenLoaded(filteredJobs));
  }
}
