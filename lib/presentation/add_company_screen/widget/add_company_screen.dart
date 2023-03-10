import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/presentation/add_company_screen/bloc/add_company_screen_cubit.dart';
import 'package:job_search/presentation/add_company_screen/usecase/create_company_usecase.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final _companyNameController = TextEditingController();
  final _companyDescriptionController = TextEditingController();
  final _companyIndustryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyDescriptionController.dispose();
    _companyIndustryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCompanyScreenCubit(
        createCompanyUsecase: CreateCompanyUsecase(
          repository: context.read<CompaniesRepository>(),
        ),
      ),
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
                  TextFormField(
                    controller: _companyNameController,
                    decoration: const InputDecoration(labelText: 'Company name'),
                    //TODO: move validator to utils, provider
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _companyDescriptionController,
                    decoration:
                        const InputDecoration(labelText: 'Company description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _companyIndustryController,
                    decoration: const InputDecoration(labelText: 'Industry'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter industry';
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
                        context.read<AddCompanyScreenCubit>().createCompany(
                              name: _companyNameController.text,
                              description: _companyDescriptionController.text,
                              industry: _companyIndustryController.text,
                            );
                        _companyNameController.text = '';
                        _companyDescriptionController.text = '';
                        _companyIndustryController.text = '';
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
