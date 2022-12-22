import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_search/data/datasources/api_client.dart';
import 'package:job_search/data/repository/companies_repository_impl.dart';
import 'package:job_search/data/repository/company_jobs_repository_impl.dart';
import 'package:job_search/data/repository/jobs_repository_impl.dart';
import 'package:job_search/domain/repository/companies_repository.dart';
import 'package:job_search/domain/repository/company_jobs_repository.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  List<SingleChildWidget> get providers => <SingleChildWidget>[
    Provider<Dio>(
      create: (context) => Dio(),
    ),
    Provider<ApiClient>(
      create: (BuildContext context) => ApiClient(
        context.read<Dio>(),
      ),
    ),
    Provider<JobsRepository>(
      create: (BuildContext context) => JobsRepositoryImpl(
        context.read<ApiClient>(),
      ),
    ),
    Provider<CompaniesRepository>(
      create: (BuildContext context) => CompaniesRepositoryImpl(
        context.read<ApiClient>(),
      ),
    ),
    Provider<CompanyJobsRepository>(
      create: (BuildContext context) => CompanyJobsRepositoryImpl(
        context.read<ApiClient>(),
      ),
    ),
  ];
}
