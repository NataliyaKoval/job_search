part of 'single_company_screen_cubit.dart';

@immutable
abstract class SingleCompanyScreenState {}

class SingleCompanyScreenInitial extends SingleCompanyScreenState {}

class SingleCompanyScreenJobsLoaded extends SingleCompanyScreenState {
  SingleCompanyScreenJobsLoaded({
    required this.companyJobs,
  });

  final List<Job> companyJobs;
}

class SingleCompanyScreenError extends SingleCompanyScreenState {}