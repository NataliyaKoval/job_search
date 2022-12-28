import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/presentation/add_job_screen/bloc/add_job_screen_cubit.dart';
import 'package:job_search/presentation/add_job_screen/usecase/create_job_usecase.dart';
import 'package:job_search/presentation/companies_screen/usecase/get_companies_usecase.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({Key? key}) : super(key: key);

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final _jobTitleController = TextEditingController();
  final _jobDescriptionController = TextEditingController();
  final _jobCityController = TextEditingController();
  String dropdownValue = '1';

  @override
  void dispose() {
    _jobTitleController.dispose();
    _jobDescriptionController.dispose();
    _jobCityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddJobScreenCubit(
        getCompaniesUsecase: GetCompaniesUsecase(
          repository: context.read<CompaniesRepository>(),
        ),
        createJobUsecase: CreateJobUsecase(
          repository: context.read<JobsRepository>(),
        ),
      )..getAllCompanies(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              child: Column(
                children: [
                  BlocBuilder<AddJobScreenCubit, AddJobScreenState>(
                    builder: (context, state) {
                      if (state is AddJobScreenCompaniesLoaded) {
                        return DropdownButton(
                          value: dropdownValue,
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: state.companiesList
                              .map<DropdownMenuItem<String>>((item) {
                            return DropdownMenuItem<String>(
                              value: item.id.toString(),
                              child: Text(item.name),
                            );
                          }).toList(),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  TextFormField(
                    controller: _jobTitleController,
                    decoration: const InputDecoration(labelText: 'Job title'),
                    //TODO: validator
                  ),
                  TextFormField(
                    controller: _jobDescriptionController,
                    decoration: const InputDecoration(labelText: 'Job description'),
                  ),
                  TextFormField(
                    controller: _jobCityController,
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AddJobScreenCubit>().createJob(
                            title: _jobTitleController.text,
                            description: _jobDescriptionController.text,
                            city: _jobCityController.text,
                            companyId: int.parse(dropdownValue),
                          );
                      _jobTitleController.text = '';
                      _jobDescriptionController.text = '';
                      _jobCityController.text = '';
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
