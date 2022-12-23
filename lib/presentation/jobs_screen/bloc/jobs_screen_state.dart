part of 'jobs_screen_bloc.dart';

@immutable
abstract class JobsScreenState {}

class JobsScreenLoading extends JobsScreenState {}

class JobsScreenInitial extends JobsScreenState {}

class JobsScreenLoaded extends JobsScreenState {
  JobsScreenLoaded(this.jobsList);

  final List<Job> jobsList;
}

class JobsScreenError extends JobsScreenState {}
