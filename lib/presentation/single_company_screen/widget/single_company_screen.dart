import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/models/company.dart';
import 'package:job_search/domain/repository/company_jobs_repository.dart';
import 'package:job_search/presentation/single_company_screen/bloc/single_company_screen_cubit.dart';
import 'package:job_search/presentation/single_company_screen/usecase/get_company_jobs_usecase.dart';
import 'package:job_search/presentation/widgets/jobs_list.dart';

class SingleCompanyScreen extends StatelessWidget {
  const SingleCompanyScreen({Key? key, required this.company})
      : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleCompanyScreenCubit(
        getCompanyJobsUsecase: GetCompanyJobsUsecase(
          repository: context.read<CompanyJobsRepository>(),
        ),
      )..getCompanyJobs(company.id.toString()),
      child: Scaffold(
        appBar: AppBar(title: Text(company.name),),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.industry,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  company.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(company.description),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SingleCompanyScreenCubit, SingleCompanyScreenState>(
                  builder: (context, state) {
                if (state is SingleCompanyScreenJobsLoaded) {
                  return Expanded(
                    child: JobsList(jobs: state.companyJobs),
                  );
                } else if (state is SingleCompanyScreenError) {
                  return const Text('JobsScreenError');
                }
                return const CircularProgressIndicator();
              })
            ],
          ),
        ),
      ),
    );
  }
}
