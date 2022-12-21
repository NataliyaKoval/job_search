import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/models/jobs_response.dart';
import 'package:job_search/presentation/jobs_screen/usecase/get_jobs_usecase.dart';

part 'jobs_screen_event.dart';

part 'jobs_screen_state.dart';

class JobsScreenBloc extends Bloc<JobsScreenEvent, JobsScreenState> {
  JobsScreenBloc({required this.getJobsUsecase}) : super(JobsScreenInitial()) {
    on<GetAllJobs>(_getAllJobs);
  }

  final GetJobsUsecase getJobsUsecase;

  Future<void> _getAllJobs(
      GetAllJobs event, Emitter<JobsScreenState> emit) async {
    try {
      emit(JobsScreenLoading());
      final JobsResponse response = await getJobsUsecase.call();
      final List<Job> allJobsList = response.result;
      emit(JobsScreenLoaded(allJobsList));
    } catch (e) {
      emit(JobsScreenError());
      print('error: $e');
    }
  }
}
