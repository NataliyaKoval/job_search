part of 'add_company_screen_cubit.dart';

@immutable
abstract class AddCompanyScreenState {}

class AddCompanyScreenInitial extends AddCompanyScreenState {}

class AddCompanyScreenError extends AddCompanyScreenState {
  AddCompanyScreenError(this.errorMessage);

  final String errorMessage;
}