import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/presentation/companies_screen/bloc/companies_screen_cubit.dart';
import 'package:job_search/presentation/companies_screen/usecase/get_companies_usecase.dart';
import 'package:job_search/presentation/companies_screen/widget/companies_list.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompaniesScreenCubit(
        getCompaniesUsecase: GetCompaniesUsecase(
          repository: context.read<CompaniesRepository>(),
        ),
      )..getAllCompanies(),
      child: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: BlocBuilder<CompaniesScreenCubit, CompaniesScreenState>(
            builder: (BuildContext context, CompaniesScreenState state) {
          if (state is CompaniesScreenLoaded) {
            return CompaniesList(
              companies: state.companiesList,
            );
          } else if (state is CompaniesScreenError) {
            return const Text('CompaniesScreenError');
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
