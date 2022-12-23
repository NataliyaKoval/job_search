import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/models/company.dart';
import 'package:job_search/presentation/companies_screen/usecase/get_companies_usecase.dart';

part 'companies_screen_state.dart';

class CompaniesScreenCubit extends Cubit<CompaniesScreenState> {
  CompaniesScreenCubit({required this.getCompaniesUsecase})
      : super(CompaniesScreenInitial());

  final GetCompaniesUsecase getCompaniesUsecase;

  Future<void> getAllCompanies() async {
    try {
      final List<Company> companies = await getCompaniesUsecase.call();
      emit(CompaniesScreenLoaded(companiesList: companies));
    } catch (e) {
      emit(CompaniesScreenError(e.toString()));
    }
  }
}
