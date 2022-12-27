import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/presentation/jobs_screen/bloc/jobs_screen_bloc.dart';
import 'package:job_search/presentation/jobs_screen/usecase/filter_jobs_usecase.dart';
import 'package:job_search/presentation/jobs_screen/usecase/get_jobs_usecase.dart';
import 'package:job_search/presentation/widgets/jobs_list.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsScreenBloc(
        getJobsUsecase: GetJobsUsecase(
          repository: context.read<JobsRepository>(),
        ),
        filterJobsUsecase: FilterJobsUsecase(),
      )..add(GetAllJobsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<JobsScreenBloc, JobsScreenState>(
          builder: (BuildContext context, JobsScreenState state) {
            if (state is JobsScreenLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (val) {
                        context
                            .read<JobsScreenBloc>()
                            .add(FilterJobsEvent(filter: val));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(child: JobsList(jobs: state.jobsList)),
                ],
              );
            } else if (state is JobsScreenError) {
              return const Text('JobsScreenError');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
