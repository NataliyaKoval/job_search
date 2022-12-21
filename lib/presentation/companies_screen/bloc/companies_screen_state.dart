part of 'companies_screen_cubit.dart';

@immutable
abstract class CompaniesScreenState {}

class CompaniesScreenInitial extends CompaniesScreenState {}

class CompaniesScreenLoaded extends CompaniesScreenState {
  CompaniesScreenLoaded({
    required this.companiesList,
  });

  final List<Company> companiesList;
}

class CompaniesScreenError extends CompaniesScreenState {
  CompaniesScreenError(this.errorMessage);

  final String errorMessage;
}

