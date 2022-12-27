import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/presentation/add_company_screen/bloc/add_company_screen_cubit.dart';
import 'package:job_search/presentation/add_company_screen/usecase/create_company_usecase.dart';
//import 'package:provider/provider.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final _companyNameController = TextEditingController();
  final _companyDescriptionController = TextEditingController();
  final _companyIndustryController = TextEditingController();

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
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
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
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AddCompanyScreenCubit>().createCompany(
                        name: _companyNameController.text,
                        description: _companyDescriptionController.text,
                        industry: _companyIndustryController.text,
                      );
                      _companyNameController.text = '';
                      _companyDescriptionController.text = '';
                      _companyIndustryController.text = '';
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
