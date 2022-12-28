import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/presentation/add_job_screen/bloc/add_job_screen_cubit.dart';
import 'package:job_search/presentation/add_job_screen/usecase/create_job_usecase.dart';
import 'package:job_search/presentation/companies_screen/usecase/get_companies_usecase.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final _jobTitleController = TextEditingController();
  final _jobDescriptionController = TextEditingController();
  final _jobCityController = TextEditingController();
  String dropdownValue = '1';
  final _formKey = GlobalKey<FormState>();

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
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter job title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _jobDescriptionController,
                    decoration:
                        const InputDecoration(labelText: 'Job description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter job description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _jobCityController,
                    decoration: const InputDecoration(labelText: 'City'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AddJobScreenCubit>().createJob(
                              title: _jobTitleController.text,
                              description: _jobDescriptionController.text,
                              city: _jobCityController.text,
                              companyId: int.parse(dropdownValue),
                            );
                        _jobTitleController.text = '';
                        _jobDescriptionController.text = '';
                        _jobCityController.text = '';
                      }
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
