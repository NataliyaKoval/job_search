part of 'add_job_screen_cubit.dart';

@immutable
abstract class AddJobScreenState {}

class AddJobScreenInitial extends AddJobScreenState {}

class AddJobScreenCompaniesLoaded extends AddJobScreenState {
  AddJobScreenCompaniesLoaded({
    required this.companiesList,
  });

  final List<Company> companiesList;
}

class AddJobScreenError extends AddJobScreenState {
  final String errorMessage;

  AddJobScreenError(this.errorMessage);
}
