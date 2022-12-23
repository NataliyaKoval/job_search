part of 'jobs_screen_bloc.dart';

@immutable
abstract class JobsScreenEvent {}

class GetAllJobsEvent extends JobsScreenEvent {}

class FilterJobsEvent extends JobsScreenEvent {
  FilterJobsEvent({
    required this.filter,
  });

  final String filter;
}