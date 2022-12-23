part of 'jobs_screen_bloc.dart';

@immutable
abstract class JobsScreenEvent {}

class GetAllJobs extends JobsScreenEvent {}

class FilterJobs extends JobsScreenEvent {
  FilterJobs({
    required this.filter,
  });

  final String filter;
}